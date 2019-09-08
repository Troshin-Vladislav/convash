CONVASH
=======

Version 0.2.7
Converter special tags in codes color linux console
@blue > \e[34m
@inline > \e[3m

TAGS:
-----

**Text modify:**
+ @default -> \e[0m
+ @bold -> \e[1m
+ @inline -> \e[3m
+ @underline -> \e[4m
+ @blinking -> \e[5m
+ @reverse -> \e[7m

**Text color:**
+ @black -> \e[30m
+ @red -> \e[31m
+ @green -> \e[32m
+ @yellow -> \e[33m
+ @blue -> \e[34m
+ @purple -> \e[35m
+ @cyan -> \e[36m
+ @grey -> \e[37m

**Background color: (@background.blue == @b.blue)**
+ @background.black -> \e[40m
+ @background.red -> \e[41m
+ @background.green -> \e[42m
+ @background.yellow -> \e[43m
+ @background.blue -> \e[44m
+ @background.purple -> \e[45m
+ @background.cyan -> \e[46m
+ @background.grey -> \e[47m


New Version 0.2.7:
------------------

**add options**
**add ability to modify the file in place**
**add shielding mode**

OPTIONS:
---------

**modify:**
modification the file in place

**shielding:**
shielding code color linux console

**033:**
write code \033 instead \e

**help:**
print help page

**version:**
print version and exit


Test:
-----

	$ ./convash test.file.txt
	$ ./convash example.txt

USE:
----

$ ./convash [options?] <file> 

![alt text](https://github.com/Troshin-Vladislav/convash/blob/master/image/convash_01.png)
