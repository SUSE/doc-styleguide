#! /bin/sh

# Date: Wed, 23 Feb 2011 10:27:29 +0100 (CET)
# From: Johannes Meixner <jsmeix@suse.de>
# To: Juergen Weigert <jw@suse.de>
# Subject: just-simple-easy - what else?
# 
# anbei just-simple-easy.lines was ich wie folgt erzeugt habe
# (mit einem ad-hoc Versuch via sed einige Falsch-Positive zu vermeiden)
# wobei ich 638 Zeilen fand, die 'just|simple|simply|easy|easily' enthalten,
# die vermutlich immer noch einige Falsch-Positive beinhalten
# (etwa "A simple test script" oder "If you prefer a simple way"):
# ---------------------------------------------------------------------------
# $ svn checkout \
# svn://svn.berlios.de/opensuse-doc/trunk/documents/distribution/en/xml \
# opensuse-doc.trunk.documents.distribution.en.xml
# 
# $ cd opensuse-doc.trunk.documents.distribution.en.xml

for f in *.xml ; \
do echo $f ; \
   cat $f \
   | sed -e '/<!--.*-->/d' \
   | sed -e '/<!--/,/-->/d' \
   | sed -e '/<remark>.*<\/remark>/d' \
   | sed -e '/<remark>/,/<\/remark>/d' \
   | egrep -i -v 'simplelist>|SIMPLEREQ>|SIMPLERSP>|adjust' \
   | egrep -2 -n -T -i 'just|simple|simply|easy|easily' ; \
   echo =============================================================== ; \
done >just-simple-easy.lines

# $ egrep 'just|simple|simply|easy|easily' just-simple-easy.lines | wc -l
# 706
