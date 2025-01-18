#~~ kitty_ipsum_1.txt info ~~

#Number of lines:27
wc -l < kitty_ipsum_1.txt >> kitty_info.txt 
#Number of words:332
wc -w < kitty_ipsum_1.txt >> kitty_info.txt
#Number of characters:1738
wc -m < kitty_ipsum_1.txt >> kitty_info.txt
#Number of times meow or meowzer appears:7
grep 'meow[a-z]*' -o kitty_ipsum_1.txt | wc -l >> kitty_info.txt
#Lines that they appear on:1 4 10 22 23
grep 'meow[a-z]*' -n kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
#Number of times cat, cats, or catnip appears: 7
grep 'cat[a-z]*' -o kitty_ipsum_1.txt | wc -l >> kitty_info.txt
#Lines that they appear on:1 3 7 17 21 22 26
grep 'cat[a-z]*' -n kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt


#~~ kitty_ipsum_2.txt info ~~

#Number of lines: 28
wc -l < kitty_ipsum_2.txt >> kitty_info.txt 
#Number of words:307
wc -w < kitty_ipsum_2.txt >> kitty_info.txt
#Number of characters:1678
wc -m < kitty_ipsum_2.txt >> kitty_info.txt
#Number of times meow or meowzer appears:9
grep 'meow[a-z]*' -o kitty_ipsum_2.txt | wc -l >> kitty_info.txt

#Lines that they appear on:4 8 12 20 24 25 28
grep 'meow[a-z]*' -n kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt

#Number of times cat, cats, or catnip appears: 8
grep 'cat[a-z]*' -o kitty_ipsum_2.txt | wc -l >> kitty_info.txt

#Lines that they appear on:10 14 19 20 25 26 28
grep 'cat[a-z]*' -n kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt

#~~ doggy_ipsum_2.txt info ~~ #with translate.sh file

cat kitty_ipsum_1.txt | ./translate.sh
cat kitty_ipsum_2.txt | ./translate.sh
#from translate.sh
cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow/woof/g'
#transfer data
/translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt
/translate.sh kitty_ipsum_2.txt > doggy_ipsum_2.txt
#check if there's a transformation
./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
#check if there's cat-related stuffs still existing
./translate.sh kitty_ipsum_1.txt | grep --color -E 'cat[a-z]*|meow[a-z]*'
#Erase the case with meowzer
cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'
#compare differences
diff kitty_ipsum_2.txt doggy_ipsum_2.txt --color
