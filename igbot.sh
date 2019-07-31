#!/bin/bash
# (C) ZSECC0DE-CREW-ID ~ WIDHISEC
# PLASE NOT RECODE FOR SCRIPT BITCH !.
hijau=$(tput setaf 2)
merah=$(tput setaf 1)
normal=$(tput sgr0)
cyan=$(tput setaf 6)
LIMITATOR=15
N=15
function spaz(){
              Whatz=$(curl 'https://www.instagram.com/accounts/account_recovery_send_ajax/' --silent \
              -H 'cookie: mid=XT1hSgALAAHZ34FxWLep2PK5YDOz; shbid=4485; shbts=1564303809.3317318; fbm_124024574287414=base_domain=.instagram.com; rur=ATN; ig_direct_region_hint=PRN; csrftoken=5NC5ANr2yYtXSzVqYanLNunCvdm5eIXn; fbsr_124024574287414=_clDFKhsEA2lChJjhs7bAIvqwNUaWs77EvFtdA1c26s.eyJjb2RlIjoiQVFBM055VkRweERqNjBWd0NiZHZ2c0wyUl9XYzZ6RW1PTnNVRllNdEdRMk9CRGM5ZXNHYWpZMmYxUUdVNWV6R3FCZlB4dElKWjV1TXB5ZzI0dU1vMzlpWXBJbVZEZUZkWDVmV1czOVFvQ3NsTE1ndWJDakU2aFRtbG1BMVh4QVB4VkNpVjd3Z1B6ZWV2V1N3LXExTXFIdEhNVm9PTVp1Y21sNWZjMXlmSllJeWVNUXMzR1diTmYyOTBDWWFDRVR6a0l3RDl4MHljdlR2alBocDY0Y3lEOW1xU2lRUTdlQ2l6aVN1VEowR0dBSVZvVndBV0YzQi1kUWVVdUQzbXB1b08tdk5INEdrUExtYXJYTWVwS0xkckE5c3dWa2NSRno4QXZvMUpMQXhaOHFrZHNKYS12Y0ZiYWtJWFJ2ZFgyeURvb09JT2VHNUwxRXg1azloNW5mODdsVWUiLCJ1c2VyX2lkIjoiMTAwMDEyODcwNjQ2ODkxIiwiYWxnb3JpdGhtIjoiSE1BQy1TSEEyNTYiLCJpc3N1ZWRfYXQiOjE1NjQ0MzY1NDl9; urlgen="{\"182.1.195.73\": 23693\054 \"182.1.221.77\": 23693\054 \"182.1.202.209\": 23693\054 \"114.125.204.239\": 23693}:1hsDPb:38uKqRw46q9aL322Bi6dJE9jPzE"' \
              -H 'origin: https://www.instagram.com' \
              -H 'accept-encoding: gzip, deflate, br' \
              -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
              -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' \
              -H 'x-requested-with: XMLHttpRequest' \
              -H 'x-csrftoken: 5NC5ANr2yYtXSzVqYanLNunCvdm5eIXn' \
              -H 'x-ig-app-id: 936619743392459' \
              -H 'pragma: no-cache' \
              -H 'x-instagram-ajax: 79d0a43d9853'\
              -H 'content-type: application/x-www-form-urlencoded' \
              -H 'accept: */*' \
              -H 'cache-control: no-cache' \
              -H 'authority: www.instagram.com' \
              -H 'referer: https://www.instagram.com/accounts/password/reset/' --data "email_or_username=$n&recaptcha_challenge_field=" --compressed | jq -r .status)
              printf "${hijau}[${normal} -> $Whatz \n"
}
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
  printf "${merah}[GAGAL LOGIN]\n"
fi
function ererer(){
           idd=$(curl "https://instagram.com/$x" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po '(?<=id":")[^"]*' | tail -1)
           xixixixixixixi=$(curl -s "https://www.instagram.com/web/friendships/$idd/follow/" -X POST \
           -H 'origin: https://www.instagram.com' \
           -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
           -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: en-US,en;q=0.9' -H 'x-requested-with: XMLHttpRequest' -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" -H 'content-type: application/x-www-form-urlencoded' -H 'accept: */*' -H 'authority: www.instagram.com' -H 'content-length: 0' --compressed)
           status=$(echo -e "$xixixixixixixi" | grep -Po '(?<=status": ")[^"]*')
           if [[ $status =~ "ok" ]]; then
           	     printf "${hijau}[#]${normal} SUCCES FOLLOWED -> $x]${hijau} \n"
           	elif [[ $status =~ "Please wait a few minutes" ]];then
		         printf "${merah}[+]${normal}Tidak bisa DIIKUTI \n"
		         sleep 30
	        else
		         printf "${merah}[+]${normal}Tidak Dapat DIIKUTI Menggunakan Alat Ini \n"
	          fi
}
function like(){
  aa=$(echo -e "$z")
	idd=$(curl "https://www.instagram.com/p/$aa" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po 'content="\K.*?(?=".*)' | grep "instagram://media?id=" | cut -d "=" -f2)
	       kamukamukmau=$(curl --silent "https://www.instagram.com/web/likes/$idd/like/" -X POST \
           -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" \
           -H 'origin: https://www.instagram.com' \
           -H 'accept-encoding: gzip, deflate, br' \
           -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
           -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
           -H 'x-requested-with: XMLHttpRequest'  \
           -H 'content-type: application/x-www-form-urlencoded' \
           -H 'accept: */*' \
           -H 'cache-control: no-cache' \
           -H 'authority: www.instagram.com' \
           -H "referer: $urlz" \
           -H 'content-length: 0' --compressed | grep -Po '(?<=status": ")[^"]*')
           if [[ $kamukamukmau =~ "ok" ]]; then
              sleep 1
           	  printf "${hijau}[${normal}SUCCES LIKE MASS]\n"
         else
           	  printf "${hijau}[${normal}TIDAK SUCCES]\n"
              rm -rf POST
           fi
}
function unlike(){
	idd=$(curl "$urlz" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po 'content="\K.*?(?=".*)' | grep "instagram://media?id=" | cut -d "=" -f2)
	       kamukamukmau22222=$(curl --silent "https://www.instagram.com/web/likes/$idd/unlike/" -X POST \
           -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
           -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" \
           -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" \
           -H 'origin: https://www.instagram.com' \
           -H 'accept-encoding: gzip, deflate, br' \
           -H "referer: $urlz" --compressed | grep -Po '(?<=status": ")[^"]*')
       if [[ $kamukamukmau22222 =~ "ok" ]]; then
           	  printf "${hijau}[${normal}SUCCES UNLIKE]${hijau}\n"
         else
           	  printf "${hijau}[${normal}TIDAK SUCCES]\n"
           fi

}
function commed(){
           idd=$(curl "$urlz" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po 'content="\K.*?(?=".*)' | grep "instagram://media?id=" | cut -d "=" -f2)
           ajajaajajjaja=$(curl -X POST --silent "https://www.instagram.com/web/comments/$idd/add/" \
           -H 'origin: https://www.instagram.com' \
           -H 'accept-encoding: gzip, deflate, br' \
           -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
           -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" \
           -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" \
           -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
           -H 'x-requested-with: XMLHttpRequest' \
           -H 'content-type: application/x-www-form-urlencoded' \
           -H 'accept: */*' \
           -H 'cache-control: no-cache' \
           -H 'authority: www.instagram.com' \
           -H 'referer: $urlz' --data "comment_text=$com&replied_to_comment_id=" --compressed | grep -Po '(?<=status": ")[^"]*')
if [[ $ajajaajajjaja =~ "ok" ]]; then
              printf "${hijau}[${normal}SUCCES COMMENT]${hijau}\n"
         else
              printf "${hijau}[${normal}TIDAK SUCCES]\n"
           fi
}
function deletez(){
         idd=$(curl "$urlz" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po 'content="\K.*?(?=".*)' | grep "instagram://media?id=" | cut -d "=" -f2)
         deletzs=$(curl "https://www.instagram.com/create/$idd/delete/" -X POST --silent \
         -H 'origin: https://www.instagram.com' \
         -H 'accept-encoding: gzip, deflate, br' \
         -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
         -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
         -H 'x-requested-with: XMLHttpRequest' \
         -H 'x-ig-app-id: 1217981644879628' \
         -H 'pragma: no-cache' \
         -H 'content-type: application/x-www-form-urlencoded' \
         -H 'accept: */*' \
         -H 'cache-control: no-cache' \
         -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" \
         -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" \
         -H 'authority: www.instagram.com' \
         -H "referer: $urlz" \
         -H 'content-length: 0' --compressed | grep -Po '(?<=status": ")[^"]*')
         if [[ $deletzs =~ "ok" ]]; then
            sleep 1
            printf "${hijau}[${normal}SUCCES DELETE FOTO]${hijau}\n"
         else
              printf "${hijau}[${normal}TIDAK SUCCES]\n"

           fi
}
function delete-mass(){
  AA=$(echo -e "$pe")
         idd=$(curl "https://www.instagram.com/p/$AA" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po 'content="\K.*?(?=".*)' | grep "instagram://media?id=" | cut -d "=" -f2)
         delet=$(curl "https://www.instagram.com/create/$idd/delete/" -X POST --silent \
         -H 'origin: https://www.instagram.com' \
         -H 'accept-encoding: gzip, deflate, br' \
         -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
         -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
         -H 'x-requested-with: XMLHttpRequest' \
         -H 'x-ig-app-id: 1217981644879628' \
         -H 'pragma: no-cache' \
         -H 'content-type: application/x-www-form-urlencoded' \
         -H 'accept: */*' \
         -H 'cache-control: no-cache' \
         -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" \
         -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" \
         -H 'authority: www.instagram.com' \
         -H "referer: $urlz" \
         -H 'content-length: 0' --compressed | grep -Po '(?<=status": ")[^"]*')
         if [[ $delet =~ "ok" ]]; then
            sleep 1
            printf "${hijau}[${normal}SUCCES DELETE FOTO IN BULK]${hijau}\n"
         else
              printf "${hijau}[${normal}TIDAK SUCCES]${hijau}\n"
           fi
}
function unlike-mass(){
  A=$(echo -e "$i")
  idd=$(curl "https://www.instagram.com/p/$A" -H 'authority: www.instagram.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --compressed --silent -L | grep -Po 'content="\K.*?(?=".*)' | grep "instagram://media?id=" | cut -d "=" -f2)
         kamuk=$(curl --silent "https://www.instagram.com/web/likes/$idd/unlike/" -X POST \
           -H 'user-agent: Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36' \
           -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" \
           -H "x-csrftoken: $csrf" -H "x-instagram-ajax: $rolout" \
           -H 'origin: https://www.instagram.com' \
           -H 'accept-encoding: gzip, deflate, br' \
           -H "referer: $urlz" --compressed | grep -Po '(?<=status": ")[^"]*')
       if [[ $kamuk =~ "ok" ]]; then
              sleep 1
              printf "${hijau}[${normal}SUCCES UNLIKE IN BULK]${hijau}\n"
         else
              printf "${hijau}[${normal}TIDAK SUCCES]${hijau}\n"
           fi

}
if [[ -z $1 ]]; then
echo -e " 
               ___    ___                        
              (@  )__(  @)                       
             /            \                      
            ( ____________ )                     
${cyan}           /\_____________/\       IS A JOKE
          /                 \                    
         / |              |  \                   
        /  |  |        |  |   \                  
\033[0;34m       /   |  |        |  |    \                 
\033[0;34m      (    |  |        |  |     )                
\033[0;34m ______\   |  |        |  |    /______           
\033[0;34m<__________|  |________|  |___________>          
           |  |        |  |                      
           VWWV        VWWV 
         [INSTAGRAM TOOLS-BOT]
           [C0DER WIDHISEC]   
EX :
${normal}
==========================================================================
$0 <user> <pass> --follow      | follow accounts instagram user
$0 <user> <pass> --like        | mass like photo instagram user
$0 <user> <pass> --unlike      | unlike photo instagram user with manually
$0 <user> <pass> --unlike-mass | unlike all photo instagram users 
$0 <user> <pass> --comments    | auto comment accounts instagram user 
$0 <user> <pass> --delete      | delete photo instagram user with manually
$0 <user> <pass> --delete-mass | delete all photos instagram user
$0  --gass                     | spam mass accounts instagram user
"
fi
if [[ $3 == "--follow" ]]; then
   echo -n "[NAME -> "; read xz
   echo "$xz" >> xz
   for x in $(cat xz); do
      startline=1 ###
    endline="$threads"
    counter=0
    default_threads="15"
    threads="${threads:-${default_threads}}"
    token=$(($counter+1))
    let counter++
    let startline+=$threads
    let endline+=$threads
    ererer "$x" "$xz" &
   done
fi
wait
if [[ $3 == "--like" ]]; then
	echo -n "${hijau}[+]${normal}username bro :"; read users
  pe=$(curl -s "https://insta-stalkerr.com/profile/$users" -L | grep -Po '(?<=href=").*?(?=")' | grep "post" | cut -d "/" -f5)
  a=$(curl -s "https://insta-stalkerr.com/profile/$users" -L | grep -Po '(?<=<a href=").*?(?=")' | grep "?userid=" | sed 's/\&amp;/\&/g')
  eee=$(echo "https://insta-stalkerr.com/profile/$users/$a")
  oaz=$(curl -s "$eee" | grep -Po '(?<=href=").*?(?=")' | grep "post" | cut -d "/" -f5)
  echo -e "$oaz" >> POST
  echo -e "$pe" >> POST
  printf "${cyan}[+]\e[1;92mtotal = `wc -l POST`\e[0m \n"
  for z in $(cat POST);do
    startline=1 ###
    endline="$threads"
    counter=0
    default_threads="15"
    threads="${threads:-${default_threads}}"
    token=$(($counter+1))
    let counter++
    let startline+=$threads
    let endline+=$threads
	like "$users" "$z" &
done
wait
elif [[ $3 == "--unlike" ]]; then
	echo -n "${hijau}[+]${normal}url bro :"; read urlz
	unlike "$urlz"
elif [[ $3 == "--comments" ]]; then
  echo -n "${hijau}[+]${normal}url bro :"; read urlz
  echo -n "${hijau}[+]${normal}comments :"; read com
  commed $com
elif [[ $3 == "--delete" ]]; then
  echo -n "${hijau}[+]${normal}url bro :"; read urlz
  deletez
elif [[ $3 == "--delete-mass" ]]; then
  echo -n "${hijau}[+]${normal}username bro :"; read users
  p=$(curl -s "https://insta-stalkerr.com/profile/$users" -L | grep -Po '(?<=href=").*?(?=")' | grep "post" | cut -d "/" -f5)
  a=$(curl -s "https://insta-stalkerr.com/profile/$users" -L | grep -Po '(?<=<a href=").*?(?=")' | grep "?userid=" | sed 's/\&amp;/\&/g')
  eee=$(echo "https://insta-stalkerr.com/profile/$users/$a")
  oaz=$(curl -s "$eee" | grep -Po '(?<=href=").*?(?=")' | grep "post" | cut -d "/" -f5)
  echo -e "$oaz" >> POST
  echo -e "$p" >> POST
  printf "${cyan}[+]\e[1;92mtotal = `wc -l POST`\e[0m \n"
  for pe in $(cat POST); do
     ((i=i%N)); ((i++==0)) && wait
     delete-mass "${pe}" "${users}"
  done
wait
elif [[ $3 == "--unlike-mass" ]]; then
  echo -n "${hijau}[+]${normal}username bro :"; read users
  p=$(curl -s "https://insta-stalkerr.com/profile/$users" -L | grep -Po '(?<=href=").*?(?=")' | grep "post" | cut -d "/" -f5)
  a=$(curl -s "https://insta-stalkerr.com/profile/$users" -L | grep -Po '(?<=<a href=").*?(?=")' | grep "?userid=" | sed 's/\&amp;/\&/g')
  eee=$(echo "https://insta-stalkerr.com/profile/$users/$a")
  oaz=$(curl -s "$eee" | grep -Po '(?<=href=").*?(?=")' | grep "post" | cut -d "/" -f5)
  echo -e "$oaz" >> POST
  echo -e "$p" >> POST
  printf "${cyan}[+]\e[1;92m total : `wc -l POST`\e[0m \n"
  for i in $(cat POST);do
  ((thread=thread%LIMITATOR)); ((thread++==0)) && wait
  unlike-mass "$users" "$i" &
  done
wait
elif [[ $1 == "--gas" ]]; then
  echo -n "[NAME = "; read n
  echo -n "[BERAPA = "; read sz
  for i in $(seq $sz); do
     startline=1 ###
    endline="$threads"
    counter=0
    default_threads="15"
    threads="${threads:-${default_threads}}"
    token=$(($counter+1))
    let counter++
    let startline+=$threads
    let endline+=$threads
     spaz "{i}" "${n}"
  done
wait
fi