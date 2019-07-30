#!/bin/bash
hijau=$(tput setaf 2)
merah=$(tput setaf 1)
normal=$(tput sgr0)
login(){
printf "\n${hijau}[+]${normal}Logining in..\n"
ambil=$(curl -D - 'https://www.instagram.com/accounts/login/' \
-H 'authority: www.instagram.com' \
-H 'upgrade-insecure-requests: 1' \
-H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
-H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
-H 'accept-encoding: gzip, deflate, br' \
-H 'accept-language: en-US,en;q=0.9' --compressed -s)
rur=$(echo -e "$ambil" | grep -Po '(?<=rur=)[^;]*')
mid=$(echo -e "$ambil" | grep -Po '(?<=mid=)[^;]*')
csrf=$(echo -e "$ambil" | grep -Po '(?<=csrftoken=)[^;]*')
mcd=$(echo -e "$ambil" | grep -Po '(?<=mcd=)[^;]*')
rolout=$(echo -e "$ambil" | grep -Po '(?<=rollout_hash":")[^"]*')
login=$(curl -D - 'https://www.instagram.com/accounts/login/ajax/' \
-H 'origin: https://www.instagram.com' \
-H 'accept-encoding: gzip, deflate, br' \
-H 'x-requested-with: XMLHttpRequest' \
-H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
-H "cookie: rur=$rur; mid=$mid; csrftoken=$csrf; mcd=$mcd" \
-H "x-csrftoken: $csrf" \
-H "x-instagram-ajax: $rolout" \
-H 'content-type: application/x-www-form-urlencoded' \
-H 'accept: */*' \
-H 'referer: https://www.instagram.com/accounts/login/' \
-H 'authority: www.instagram.com' --data "username=$1&password=$2&queryParams=%7B%7D" --compressed -s -L)
check=$(echo -e "$login" | grep -Po '(?<=checkpoint_url": ")[^"]*')
usid=$(echo -e "$login" | grep -Po '(?<=userId": ")[^"]*')
isauth=$(echo -e "$login" | grep -Po '(?<=authenticated": )[^,]*')
session=$(echo -e "$login" | grep -Po '(?<=sessionid=)[^;]*')
if [[ $isauth =~ "true" ]]
then
  printf "${hijau}[+]${normal}Login Success..\n"
  printf "${hijau}[+]${normal}User ID : $usid\n"
else
  printf "[GAGAL LOGIN]\n"
fi
}
function aexzzzz(){
           idd=$(curl "https://instagram.com/`cat user`" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po '(?<=id":")[^"]*' | tail -1)
           xixixixixixixi=$(curl -s "https://www.instagram.com/web/friendships/$idd/follow/" -X POST \
           -H 'origin: https://www.instagram.com' \
           -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
           -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: en-US,en;q=0.9' -H 'x-requested-with: XMLHttpRequest' -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" -H 'content-type: application/x-www-form-urlencoded' -H 'accept: */*' -H 'authority: www.instagram.com' -H 'content-length: 0' --compressed)
           status=$(echo -e "$xixixixixixixi" | grep -Po '(?<=status": ")[^"]*')
           if [[ $status =~ "ok" ]]; then
                 printf "${hijau}[#]${normal}SUCCES FOLLOWED]${hijau} \n"
                 exit
            elif [[ $status =~ "Please wait a few minutes" ]];then
             printf "${merah}[+]${normal}Tidak bisa DIIKUTI \n"
             sleep 30
        else
             printf "${merah}[-]${normal}Tidak Dapat DIIKUTI Menggunakan Alat Ini \n"
             fi
}
echo "List In This Directory : "
ls
echo "Delimeter list -> email|password"
echo -n "Masukan File List : "
read USERmailist;
nomor=1
jumlahlines=$(cat $USERmailist | wc -l | cut -f1 -d' ')
hitung=0
IFS=$'\r\n' GLOBIGNORE='*' command eval 'bacot=($(cat $USERmailist))'
waktumulai=$(date +%s)
for (( i = 0; i <"${#bacot[@]}"; i++ )); do
EMPAS="${bacot[$i]}"
IFS='|' read -r -a array <<< "$EMPAS"
EMAIL=${array[0]}
PASS=${array[1]}
number=$((nomor++))
kamu=$(expr $hitung % 1)
if [[ $kamu == 0 && $hitung > 0 ]]; then
sleep 1
fi
login $EMAIL $PASS $penambahan $number
aexzzzz &
hitung=$[$hitung+1]
done
wait