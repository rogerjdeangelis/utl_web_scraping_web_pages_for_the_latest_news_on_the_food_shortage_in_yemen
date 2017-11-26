Scraping web pages for the latest news on the food shortage in Yemen

see
https://stackoverflow.com/questions/47489401/r-webscraping-dataset

http://www.fao.org/countryprofiles/common/allnews/en/?iso3=YEM&allnews=no&limit=2

Maydin profile
https://stackoverflow.com/users/7224354/maydin

INPUT
=====
    %let url='http://www.fao.org/countryprofiles/common/allnews/en/?iso3=&country.&allnews=no&limit=2';

WORKING CODE
============
    news<- fromJSON(&url);
    want<-as.data.frame(cbind(news$date_format,news$title,news$bodytext));

OUTPUT
======
    -- CHARACTER --    TYPE  LENGTH

   DATE                   C    10      10/11/2017
   TITLE                  C    84      Pope Francis war  ..........
   BODYTEXT               C    645     10 November 2017  .........

  WORK.WANT  total obs=2

     DATE                                               TITLE
    10/11/2017    Pope Francis warns real priorities relegated to second place due to nuclear spending
    20/10/2017    FAO support provides water sustainability for farmers while empowering women

                                                       BODYTEXT
    10 November 2017, Rome - Pope Francis warned today that the real priorities facing humankind, including  ...
    ertaking of educational, ecological and healthcare projects, and the development of human rights, are relegated t ...
    ions in the escalation of the arms race. "Weapons of mass destruction, particularly nuclear weapons, create nothi ...
    he basis for peaceful coexistence between members of the human family, which must rather be inspired by an ethics ...


    A Food and Agriculture Organization of the United Nations (FAO) program in Yemen is helping farmers take        ...
    women more opportunities to exert themselves in the country’s conservative decision-making process.             ...
    nd reorganization of some 38 Water User Associations in the capital Sanaa to better regulate water consumption. ...
    tions with funding, equipment, and – in the process – cultivated room for new thinking.                         ...

*                _                _       _
 _ __ ___   __ _| | _____      __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \    / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/   | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|    \__,_|\__,_|\__\__,_|

;

see steps below to get this URL

%let url='http://www.fao.org/countryprofiles/common/allnews/en/?iso3=USA&allnews=no&limit=2'

STEPS
=====
You have to do a little bit of mouse scripting

You need to find the shortname for the country of interest, Yemen in this case.

If you go to this web page

   http://www.fao.org/countryprofiles/en/

and scroll down and select "Yemen"

   the address bar will then contain

   http://www.fao.org/countryprofiles/common/allnews/en/?iso=YEM

So YEM is the shortname for Yemen.

A seach box will appear on this page.

If you type 'allnews' in the search cbar you will
get the current news page.

Here is how the location of the top two news messages in JSON structite

&allnews=no&limit=2 is the translation of the search.

http://www.fao.org/countryprofiles/common/allnews/en/?iso3=YEM&allnews=no&limit=2

Note to get USA just

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utl_submit_r64("
library(jsonlite);
library(SASxport);
library(datetime);
news<- fromJSON(&url);
want<-as.data.frame(cbind(news$date_format,news$title,news$bodytext));
colnames(want)<-c('DATE','TITLE','BODYTEXT');
write.xport(want,file='d:/xpt/want.xpt',autogen.formats = FALSE);
");


libname xpt xport "d:/xpt/want.xpt";
data want;
  set xpt.want;
run;quit;
libname xpt clear;



