<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
	xmlns:ccts="urn:un:unece:uncefact:documentation:2"
	xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001"
	xmlns:clm5639="urn:un:unece:uncefact:codelist:specification:5639:1988"
	xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001"
	xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:link="http://www.xbrl.org/2003/linkbase"
	xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
	xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance"
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="cac cbc ccts clm54217 clm5639 clm66411 clmIANAMIMEMediaType fn link n1 qdt udt xbrldi xbrli xdt xlink xs xsd xsi">
	<xsl:decimal-format name="european" decimal-separator="," grouping-separator="." NaN=""/>
<xsl:output version="4.0" method="html" indent="no" encoding="UTF-8"
	doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
	doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:param name="SV_OutputFormat" select="'HTML'"/>

<xsl:template name="repNL">
  <xsl:param name="pText" select="."/>
  <xsl:if test="not(contains(substring(substring-before(concat($pText,'&#xA;'),'&#xA;'),0,8), '##') and not(contains(substring-before(concat($pText,'&#xA;'),'&#xA;'), '##internetSatis'))) and string-length(substring-before(concat($pText,'&#xA;'),'&#xA;'))>3">
  	<xsl:choose>
  	<xsl:when test="contains(substring-before(concat($pText,'&#xA;'),'&#xA;'), '##internetSatis')">
  		<b>* </b>  <xsl:copy-of select="substring-after(substring-after(substring-before(concat($pText,'&#xA;'),'&#xA;'),'##'),'#')"/><br />
  	</xsl:when>
  	<xsl:otherwise>
  		<b>* </b>  <xsl:copy-of select="substring-before(concat($pText,'&#xA;'),'&#xA;')"/><br />
  	</xsl:otherwise>
  	</xsl:choose>
	</xsl:if>
  <xsl:if test="contains($pText, '&#xA;')">
  	
   <xsl:call-template name="repNL">
    <xsl:with-param name="pText" select=
    "substring-after($pText, '&#xA;')"/>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>

<xsl:template name="repNL2">
  <xsl:param name="pText" select="."/>
  <xsl:if test="contains(substring(substring-before(concat($pText,'&#xA;'),'&#xA;'),0,8), '##') and not(contains(substring-before(concat($pText,'&#xA;'),'&#xA;'), '##internetSatis'))">
  	<tr>
		<th><xsl:copy-of select="substring-after(substring-before(substring-before(concat($pText,'&#xA;'),'&#xA;'),':'),'##')"></xsl:copy-of>:</th>
		<td><xsl:copy-of select="substring-after(substring-before(concat($pText,'&#xA;'),'&#xA;'),':')"></xsl:copy-of></td>
		</tr>
	</xsl:if>
  <xsl:if test="contains($pText, '&#xA;')">
   <xsl:call-template name="repNL2">
    <xsl:with-param name="pText" select=
    "substring-after($pText, '&#xA;')"/>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>

<xsl:variable name="XML" select="/"/>
<xsl:template name="removeLeadingZeros">
<xsl:param name="originalString"/>
	<xsl:choose>
		<xsl:when test="starts-with($originalString,'0')">
			<xsl:call-template name="removeLeadingZeros">
				<xsl:with-param name="originalString">
					<xsl:value-of select="substring-after($originalString,'0' )"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$originalString"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
		<xsl:template match="/">
	<xsl:comment>eFinans Şablon Tasarım Aracı İle Hazırlanmıştır.</xsl:comment>
	<html>
<head>

<script type="text/javascript">
                    <![CDATA[var QRCode;!function(){function a(a){this.mode=c.MODE_8BIT_BYTE,this.data=a,this.parsedData=[];for(var b=[],d=0,e=this.data.length;e>d;d++){var f=this.data.charCodeAt(d);f>65536?(b[0]=240|(1835008&f)>>>18,b[1]=128|(258048&f)>>>12,b[2]=128|(4032&f)>>>6,b[3]=128|63&f):f>2048?(b[0]=224|(61440&f)>>>12,b[1]=128|(4032&f)>>>6,b[2]=128|63&f):f>128?(b[0]=192|(1984&f)>>>6,b[1]=128|63&f):b[0]=f,this.parsedData=this.parsedData.concat(b)}this.parsedData.length!=this.data.length&&(this.parsedData.unshift(191),this.parsedData.unshift(187),this.parsedData.unshift(239))}function b(a,b){this.typeNumber=a,this.errorCorrectLevel=b,this.modules=null,this.moduleCount=0,this.dataCache=null,this.dataList=[]}function i(a,b){if(void 0==a.length)throw new Error(a.length+"/"+b);for(var c=0;c<a.length&&0==a[c];)c++;this.num=new Array(a.length-c+b);for(var d=0;d<a.length-c;d++)this.num[d]=a[d+c]}function j(a,b){this.totalCount=a,this.dataCount=b}function k(){this.buffer=[],this.length=0}function m(){return"undefined"!=typeof CanvasRenderingContext2D}function n(){var a=!1,b=navigator.userAgent;return/android/i.test(b)&&(a=!0,aMat=b.toString().match(/android ([0-9]\.[0-9])/i),aMat&&aMat[1]&&(a=parseFloat(aMat[1]))),a}function r(a,b){for(var c=1,e=s(a),f=0,g=l.length;g>=f;f++){var h=0;switch(b){case d.L:h=l[f][0];break;case d.M:h=l[f][1];break;case d.Q:h=l[f][2];break;case d.H:h=l[f][3]}if(h>=e)break;c++}if(c>l.length)throw new Error("Too long data");return c}function s(a){var b=encodeURI(a).toString().replace(/\%[0-9a-fA-F]{2}/g,"a");return b.length+(b.length!=a?3:0)}a.prototype={getLength:function(){return this.parsedData.length},write:function(a){for(var b=0,c=this.parsedData.length;c>b;b++)a.put(this.parsedData[b],8)}},b.prototype={addData:function(b){var c=new a(b);this.dataList.push(c),this.dataCache=null},isDark:function(a,b){if(0>a||this.moduleCount<=a||0>b||this.moduleCount<=b)throw new Error(a+","+b);return this.modules[a][b]},getModuleCount:function(){return this.moduleCount},make:function(){this.makeImpl(!1,this.getBestMaskPattern())},makeImpl:function(a,c){this.moduleCount=4*this.typeNumber+17,this.modules=new Array(this.moduleCount);for(var d=0;d<this.moduleCount;d++){this.modules[d]=new Array(this.moduleCount);for(var e=0;e<this.moduleCount;e++)this.modules[d][e]=null}this.setupPositionProbePattern(0,0),this.setupPositionProbePattern(this.moduleCount-7,0),this.setupPositionProbePattern(0,this.moduleCount-7),this.setupPositionAdjustPattern(),this.setupTimingPattern(),this.setupTypeInfo(a,c),this.typeNumber>=7&&this.setupTypeNumber(a),null==this.dataCache&&(this.dataCache=b.createData(this.typeNumber,this.errorCorrectLevel,this.dataList)),this.mapData(this.dataCache,c)},setupPositionProbePattern:function(a,b){for(var c=-1;7>=c;c++)if(!(-1>=a+c||this.moduleCount<=a+c))for(var d=-1;7>=d;d++)-1>=b+d||this.moduleCount<=b+d||(this.modules[a+c][b+d]=c>=0&&6>=c&&(0==d||6==d)||d>=0&&6>=d&&(0==c||6==c)||c>=2&&4>=c&&d>=2&&4>=d?!0:!1)},getBestMaskPattern:function(){for(var a=0,b=0,c=0;8>c;c++){this.makeImpl(!0,c);var d=f.getLostPoint(this);(0==c||a>d)&&(a=d,b=c)}return b},createMovieClip:function(a,b,c){var d=a.createEmptyMovieClip(b,c),e=1;this.make();for(var f=0;f<this.modules.length;f++)for(var g=f*e,h=0;h<this.modules[f].length;h++){var i=h*e,j=this.modules[f][h];j&&(d.beginFill(0,100),d.moveTo(i,g),d.lineTo(i+e,g),d.lineTo(i+e,g+e),d.lineTo(i,g+e),d.endFill())}return d},setupTimingPattern:function(){for(var a=8;a<this.moduleCount-8;a++)null==this.modules[a][6]&&(this.modules[a][6]=0==a%2);for(var b=8;b<this.moduleCount-8;b++)null==this.modules[6][b]&&(this.modules[6][b]=0==b%2)},setupPositionAdjustPattern:function(){for(var a=f.getPatternPosition(this.typeNumber),b=0;b<a.length;b++)for(var c=0;c<a.length;c++){var d=a[b],e=a[c];if(null==this.modules[d][e])for(var g=-2;2>=g;g++)for(var h=-2;2>=h;h++)this.modules[d+g][e+h]=-2==g||2==g||-2==h||2==h||0==g&&0==h?!0:!1}},setupTypeNumber:function(a){for(var b=f.getBCHTypeNumber(this.typeNumber),c=0;18>c;c++){var d=!a&&1==(1&b>>c);this.modules[Math.floor(c/3)][c%3+this.moduleCount-8-3]=d}for(var c=0;18>c;c++){var d=!a&&1==(1&b>>c);this.modules[c%3+this.moduleCount-8-3][Math.floor(c/3)]=d}},setupTypeInfo:function(a,b){for(var c=this.errorCorrectLevel<<3|b,d=f.getBCHTypeInfo(c),e=0;15>e;e++){var g=!a&&1==(1&d>>e);6>e?this.modules[e][8]=g:8>e?this.modules[e+1][8]=g:this.modules[this.moduleCount-15+e][8]=g}for(var e=0;15>e;e++){var g=!a&&1==(1&d>>e);8>e?this.modules[8][this.moduleCount-e-1]=g:9>e?this.modules[8][15-e-1+1]=g:this.modules[8][15-e-1]=g}this.modules[this.moduleCount-8][8]=!a},mapData:function(a,b){for(var c=-1,d=this.moduleCount-1,e=7,g=0,h=this.moduleCount-1;h>0;h-=2)for(6==h&&h--;;){for(var i=0;2>i;i++)if(null==this.modules[d][h-i]){var j=!1;g<a.length&&(j=1==(1&a[g]>>>e));var k=f.getMask(b,d,h-i);k&&(j=!j),this.modules[d][h-i]=j,e--,-1==e&&(g++,e=7)}if(d+=c,0>d||this.moduleCount<=d){d-=c,c=-c;break}}}},b.PAD0=236,b.PAD1=17,b.createData=function(a,c,d){for(var e=j.getRSBlocks(a,c),g=new k,h=0;h<d.length;h++){var i=d[h];g.put(i.mode,4),g.put(i.getLength(),f.getLengthInBits(i.mode,a)),i.write(g)}for(var l=0,h=0;h<e.length;h++)l+=e[h].dataCount;if(g.getLengthInBits()>8*l)throw new Error("code length overflow. ("+g.getLengthInBits()+">"+8*l+")");for(g.getLengthInBits()+4<=8*l&&g.put(0,4);0!=g.getLengthInBits()%8;)g.putBit(!1);for(;;){if(g.getLengthInBits()>=8*l)break;if(g.put(b.PAD0,8),g.getLengthInBits()>=8*l)break;g.put(b.PAD1,8)}return b.createBytes(g,e)},b.createBytes=function(a,b){for(var c=0,d=0,e=0,g=new Array(b.length),h=new Array(b.length),j=0;j<b.length;j++){var k=b[j].dataCount,l=b[j].totalCount-k;d=Math.max(d,k),e=Math.max(e,l),g[j]=new Array(k);for(var m=0;m<g[j].length;m++)g[j][m]=255&a.buffer[m+c];c+=k;var n=f.getErrorCorrectPolynomial(l),o=new i(g[j],n.getLength()-1),p=o.mod(n);h[j]=new Array(n.getLength()-1);for(var m=0;m<h[j].length;m++){var q=m+p.getLength()-h[j].length;h[j][m]=q>=0?p.get(q):0}}for(var r=0,m=0;m<b.length;m++)r+=b[m].totalCount;for(var s=new Array(r),t=0,m=0;d>m;m++)for(var j=0;j<b.length;j++)m<g[j].length&&(s[t++]=g[j][m]);for(var m=0;e>m;m++)for(var j=0;j<b.length;j++)m<h[j].length&&(s[t++]=h[j][m]);return s};for(var c={MODE_NUMBER:1,MODE_ALPHA_NUM:2,MODE_8BIT_BYTE:4,MODE_KANJI:8},d={L:1,M:0,Q:3,H:2},e={PATTERN000:0,PATTERN001:1,PATTERN010:2,PATTERN011:3,PATTERN100:4,PATTERN101:5,PATTERN110:6,PATTERN111:7},f={PATTERN_POSITION_TABLE:[[],[6,18],[6,22],[6,26],[6,30],[6,34],[6,22,38],[6,24,42],[6,26,46],[6,28,50],[6,30,54],[6,32,58],[6,34,62],[6,26,46,66],[6,26,48,70],[6,26,50,74],[6,30,54,78],[6,30,56,82],[6,30,58,86],[6,34,62,90],[6,28,50,72,94],[6,26,50,74,98],[6,30,54,78,102],[6,28,54,80,106],[6,32,58,84,110],[6,30,58,86,114],[6,34,62,90,118],[6,26,50,74,98,122],[6,30,54,78,102,126],[6,26,52,78,104,130],[6,30,56,82,108,134],[6,34,60,86,112,138],[6,30,58,86,114,142],[6,34,62,90,118,146],[6,30,54,78,102,126,150],[6,24,50,76,102,128,154],[6,28,54,80,106,132,158],[6,32,58,84,110,136,162],[6,26,54,82,110,138,166],[6,30,58,86,114,142,170]],G15:1335,G18:7973,G15_MASK:21522,getBCHTypeInfo:function(a){for(var b=a<<10;f.getBCHDigit(b)-f.getBCHDigit(f.G15)>=0;)b^=f.G15<<f.getBCHDigit(b)-f.getBCHDigit(f.G15);return(a<<10|b)^f.G15_MASK},getBCHTypeNumber:function(a){for(var b=a<<12;f.getBCHDigit(b)-f.getBCHDigit(f.G18)>=0;)b^=f.G18<<f.getBCHDigit(b)-f.getBCHDigit(f.G18);return a<<12|b},getBCHDigit:function(a){for(var b=0;0!=a;)b++,a>>>=1;return b},getPatternPosition:function(a){return f.PATTERN_POSITION_TABLE[a-1]},getMask:function(a,b,c){switch(a){case e.PATTERN000:return 0==(b+c)%2;case e.PATTERN001:return 0==b%2;case e.PATTERN010:return 0==c%3;case e.PATTERN011:return 0==(b+c)%3;case e.PATTERN100:return 0==(Math.floor(b/2)+Math.floor(c/3))%2;case e.PATTERN101:return 0==b*c%2+b*c%3;case e.PATTERN110:return 0==(b*c%2+b*c%3)%2;case e.PATTERN111:return 0==(b*c%3+(b+c)%2)%2;default:throw new Error("bad maskPattern:"+a)}},getErrorCorrectPolynomial:function(a){for(var b=new i([1],0),c=0;a>c;c++)b=b.multiply(new i([1,g.gexp(c)],0));return b},getLengthInBits:function(a,b){if(b>=1&&10>b)switch(a){case c.MODE_NUMBER:return 10;case c.MODE_ALPHA_NUM:return 9;case c.MODE_8BIT_BYTE:return 8;case c.MODE_KANJI:return 8;default:throw new Error("mode:"+a)}else if(27>b)switch(a){case c.MODE_NUMBER:return 12;case c.MODE_ALPHA_NUM:return 11;case c.MODE_8BIT_BYTE:return 16;case c.MODE_KANJI:return 10;default:throw new Error("mode:"+a)}else{if(!(41>b))throw new Error("type:"+b);switch(a){case c.MODE_NUMBER:return 14;case c.MODE_ALPHA_NUM:return 13;case c.MODE_8BIT_BYTE:return 16;case c.MODE_KANJI:return 12;default:throw new Error("mode:"+a)}}},getLostPoint:function(a){for(var b=a.getModuleCount(),c=0,d=0;b>d;d++)for(var e=0;b>e;e++){for(var f=0,g=a.isDark(d,e),h=-1;1>=h;h++)if(!(0>d+h||d+h>=b))for(var i=-1;1>=i;i++)0>e+i||e+i>=b||(0!=h||0!=i)&&g==a.isDark(d+h,e+i)&&f++;f>5&&(c+=3+f-5)}for(var d=0;b-1>d;d++)for(var e=0;b-1>e;e++){var j=0;a.isDark(d,e)&&j++,a.isDark(d+1,e)&&j++,a.isDark(d,e+1)&&j++,a.isDark(d+1,e+1)&&j++,(0==j||4==j)&&(c+=3)}for(var d=0;b>d;d++)for(var e=0;b-6>e;e++)a.isDark(d,e)&&!a.isDark(d,e+1)&&a.isDark(d,e+2)&&a.isDark(d,e+3)&&a.isDark(d,e+4)&&!a.isDark(d,e+5)&&a.isDark(d,e+6)&&(c+=40);for(var e=0;b>e;e++)for(var d=0;b-6>d;d++)a.isDark(d,e)&&!a.isDark(d+1,e)&&a.isDark(d+2,e)&&a.isDark(d+3,e)&&a.isDark(d+4,e)&&!a.isDark(d+5,e)&&a.isDark(d+6,e)&&(c+=40);for(var k=0,e=0;b>e;e++)for(var d=0;b>d;d++)a.isDark(d,e)&&k++;var l=Math.abs(100*k/b/b-50)/5;return c+=10*l}},g={glog:function(a){if(1>a)throw new Error("glog("+a+")");return g.LOG_TABLE[a]},gexp:function(a){for(;0>a;)a+=255;for(;a>=256;)a-=255;return g.EXP_TABLE[a]},EXP_TABLE:new Array(256),LOG_TABLE:new Array(256)},h=0;8>h;h++)g.EXP_TABLE[h]=1<<h;for(var h=8;256>h;h++)g.EXP_TABLE[h]=g.EXP_TABLE[h-4]^g.EXP_TABLE[h-5]^g.EXP_TABLE[h-6]^g.EXP_TABLE[h-8];for(var h=0;255>h;h++)g.LOG_TABLE[g.EXP_TABLE[h]]=h;i.prototype={get:function(a){return this.num[a]},getLength:function(){return this.num.length},multiply:function(a){for(var b=new Array(this.getLength()+a.getLength()-1),c=0;c<this.getLength();c++)for(var d=0;d<a.getLength();d++)b[c+d]^=g.gexp(g.glog(this.get(c))+g.glog(a.get(d)));return new i(b,0)},mod:function(a){if(this.getLength()-a.getLength()<0)return this;for(var b=g.glog(this.get(0))-g.glog(a.get(0)),c=new Array(this.getLength()),d=0;d<this.getLength();d++)c[d]=this.get(d);for(var d=0;d<a.getLength();d++)c[d]^=g.gexp(g.glog(a.get(d))+b);return new i(c,0).mod(a)}},j.RS_BLOCK_TABLE=[[1,26,19],[1,26,16],[1,26,13],[1,26,9],[1,44,34],[1,44,28],[1,44,22],[1,44,16],[1,70,55],[1,70,44],[2,35,17],[2,35,13],[1,100,80],[2,50,32],[2,50,24],[4,25,9],[1,134,108],[2,67,43],[2,33,15,2,34,16],[2,33,11,2,34,12],[2,86,68],[4,43,27],[4,43,19],[4,43,15],[2,98,78],[4,49,31],[2,32,14,4,33,15],[4,39,13,1,40,14],[2,121,97],[2,60,38,2,61,39],[4,40,18,2,41,19],[4,40,14,2,41,15],[2,146,116],[3,58,36,2,59,37],[4,36,16,4,37,17],[4,36,12,4,37,13],[2,86,68,2,87,69],[4,69,43,1,70,44],[6,43,19,2,44,20],[6,43,15,2,44,16],[4,101,81],[1,80,50,4,81,51],[4,50,22,4,51,23],[3,36,12,8,37,13],[2,116,92,2,117,93],[6,58,36,2,59,37],[4,46,20,6,47,21],[7,42,14,4,43,15],[4,133,107],[8,59,37,1,60,38],[8,44,20,4,45,21],[12,33,11,4,34,12],[3,145,115,1,146,116],[4,64,40,5,65,41],[11,36,16,5,37,17],[11,36,12,5,37,13],[5,109,87,1,110,88],[5,65,41,5,66,42],[5,54,24,7,55,25],[11,36,12],[5,122,98,1,123,99],[7,73,45,3,74,46],[15,43,19,2,44,20],[3,45,15,13,46,16],[1,135,107,5,136,108],[10,74,46,1,75,47],[1,50,22,15,51,23],[2,42,14,17,43,15],[5,150,120,1,151,121],[9,69,43,4,70,44],[17,50,22,1,51,23],[2,42,14,19,43,15],[3,141,113,4,142,114],[3,70,44,11,71,45],[17,47,21,4,48,22],[9,39,13,16,40,14],[3,135,107,5,136,108],[3,67,41,13,68,42],[15,54,24,5,55,25],[15,43,15,10,44,16],[4,144,116,4,145,117],[17,68,42],[17,50,22,6,51,23],[19,46,16,6,47,17],[2,139,111,7,140,112],[17,74,46],[7,54,24,16,55,25],[34,37,13],[4,151,121,5,152,122],[4,75,47,14,76,48],[11,54,24,14,55,25],[16,45,15,14,46,16],[6,147,117,4,148,118],[6,73,45,14,74,46],[11,54,24,16,55,25],[30,46,16,2,47,17],[8,132,106,4,133,107],[8,75,47,13,76,48],[7,54,24,22,55,25],[22,45,15,13,46,16],[10,142,114,2,143,115],[19,74,46,4,75,47],[28,50,22,6,51,23],[33,46,16,4,47,17],[8,152,122,4,153,123],[22,73,45,3,74,46],[8,53,23,26,54,24],[12,45,15,28,46,16],[3,147,117,10,148,118],[3,73,45,23,74,46],[4,54,24,31,55,25],[11,45,15,31,46,16],[7,146,116,7,147,117],[21,73,45,7,74,46],[1,53,23,37,54,24],[19,45,15,26,46,16],[5,145,115,10,146,116],[19,75,47,10,76,48],[15,54,24,25,55,25],[23,45,15,25,46,16],[13,145,115,3,146,116],[2,74,46,29,75,47],[42,54,24,1,55,25],[23,45,15,28,46,16],[17,145,115],[10,74,46,23,75,47],[10,54,24,35,55,25],[19,45,15,35,46,16],[17,145,115,1,146,116],[14,74,46,21,75,47],[29,54,24,19,55,25],[11,45,15,46,46,16],[13,145,115,6,146,116],[14,74,46,23,75,47],[44,54,24,7,55,25],[59,46,16,1,47,17],[12,151,121,7,152,122],[12,75,47,26,76,48],[39,54,24,14,55,25],[22,45,15,41,46,16],[6,151,121,14,152,122],[6,75,47,34,76,48],[46,54,24,10,55,25],[2,45,15,64,46,16],[17,152,122,4,153,123],[29,74,46,14,75,47],[49,54,24,10,55,25],[24,45,15,46,46,16],[4,152,122,18,153,123],[13,74,46,32,75,47],[48,54,24,14,55,25],[42,45,15,32,46,16],[20,147,117,4,148,118],[40,75,47,7,76,48],[43,54,24,22,55,25],[10,45,15,67,46,16],[19,148,118,6,149,119],[18,75,47,31,76,48],[34,54,24,34,55,25],[20,45,15,61,46,16]],j.getRSBlocks=function(a,b){var c=j.getRsBlockTable(a,b);if(void 0==c)throw new Error("bad rs block @ typeNumber:"+a+"/errorCorrectLevel:"+b);for(var d=c.length/3,e=[],f=0;d>f;f++)for(var g=c[3*f+0],h=c[3*f+1],i=c[3*f+2],k=0;g>k;k++)e.push(new j(h,i));return e},j.getRsBlockTable=function(a,b){switch(b){case d.L:return j.RS_BLOCK_TABLE[4*(a-1)+0];case d.M:return j.RS_BLOCK_TABLE[4*(a-1)+1];case d.Q:return j.RS_BLOCK_TABLE[4*(a-1)+2];case d.H:return j.RS_BLOCK_TABLE[4*(a-1)+3];default:return void 0}},k.prototype={get:function(a){var b=Math.floor(a/8);return 1==(1&this.buffer[b]>>>7-a%8)},put:function(a,b){for(var c=0;b>c;c++)this.putBit(1==(1&a>>>b-c-1))},getLengthInBits:function(){return this.length},putBit:function(a){var b=Math.floor(this.length/8);this.buffer.length<=b&&this.buffer.push(0),a&&(this.buffer[b]|=128>>>this.length%8),this.length++}};var l=[[17,14,11,7],[32,26,20,14],[53,42,32,24],[78,62,46,34],[106,84,60,44],[134,106,74,58],[154,122,86,64],[192,152,108,84],[230,180,130,98],[271,213,151,119],[321,251,177,137],[367,287,203,155],[425,331,241,177],[458,362,258,194],[520,412,292,220],[586,450,322,250],[644,504,364,280],[718,560,394,310],[792,624,442,338],[858,666,482,382],[929,711,509,403],[1003,779,565,439],[1091,857,611,461],[1171,911,661,511],[1273,997,715,535],[1367,1059,751,593],[1465,1125,805,625],[1528,1190,868,658],[1628,1264,908,698],[1732,1370,982,742],[1840,1452,1030,790],[1952,1538,1112,842],[2068,1628,1168,898],[2188,1722,1228,958],[2303,1809,1283,983],[2431,1911,1351,1051],[2563,1989,1423,1093],[2699,2099,1499,1139],[2809,2213,1579,1219],[2953,2331,1663,1273]],o=function(){var a=function(a,b){this._el=a,this._htOption=b};return a.prototype.draw=function(a){function g(a,b){var c=document.createElementNS("http://www.w3.org/2000/svg",a);for(var d in b)b.hasOwnProperty(d)&&c.setAttribute(d,b[d]);return c}var b=this._htOption,c=this._el,d=a.getModuleCount();Math.floor(b.width/d),Math.floor(b.height/d),this.clear();var h=g("svg",{viewBox:"0 0 "+String(d)+" "+String(d),width:"100%",height:"100%",fill:b.colorLight});h.setAttributeNS("http://www.w3.org/2000/xmlns/","xmlns:xlink","http://www.w3.org/1999/xlink"),c.appendChild(h),h.appendChild(g("rect",{fill:b.colorDark,width:"1",height:"1",id:"template"}));for(var i=0;d>i;i++)for(var j=0;d>j;j++)if(a.isDark(i,j)){var k=g("use",{x:String(i),y:String(j)});k.setAttributeNS("http://www.w3.org/1999/xlink","href","#template"),h.appendChild(k)}},a.prototype.clear=function(){for(;this._el.hasChildNodes();)this._el.removeChild(this._el.lastChild)},a}(),p="svg"===document.documentElement.tagName.toLowerCase(),q=p?o:m()?function(){function a(){this._elImage.src=this._elCanvas.toDataURL("image/png"),this._elImage.style.display="block",this._elImage.style.margin="auto",this._elCanvas.style.display="none"}function d(a,b){var c=this;if(c._fFail=b,c._fSuccess=a,null===c._bSupportDataURI){var d=document.createElement("img"),e=function(){c._bSupportDataURI=!1,c._fFail&&_fFail.call(c)},f=function(){c._bSupportDataURI=!0,c._fSuccess&&c._fSuccess.call(c)};return d.onabort=e,d.onerror=e,d.onload=f,d.src="data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==",void 0}c._bSupportDataURI===!0&&c._fSuccess?c._fSuccess.call(c):c._bSupportDataURI===!1&&c._fFail&&c._fFail.call(c)}if(this._android&&this._android<=2.1){var b=1/window.devicePixelRatio,c=CanvasRenderingContext2D.prototype.drawImage;CanvasRenderingContext2D.prototype.drawImage=function(a,d,e,f,g,h,i,j){if("nodeName"in a&&/img/i.test(a.nodeName))for(var l=arguments.length-1;l>=1;l--)arguments[l]=arguments[l]*b;else"undefined"==typeof j&&(arguments[1]*=b,arguments[2]*=b,arguments[3]*=b,arguments[4]*=b);c.apply(this,arguments)}}var e=function(a,b){this._bIsPainted=!1,this._android=n(),this._htOption=b,this._elCanvas=document.createElement("canvas"),this._elCanvas.width=b.width,this._elCanvas.height=b.height,a.appendChild(this._elCanvas),this._el=a,this._oContext=this._elCanvas.getContext("2d"),this._bIsPainted=!1,this._elImage=document.createElement("img"),this._elImage.style.display="none",this._el.appendChild(this._elImage),this._bSupportDataURI=null};return e.prototype.draw=function(a){var b=this._elImage,c=this._oContext,d=this._htOption,e=a.getModuleCount(),f=d.width/e,g=d.height/e,h=Math.round(f),i=Math.round(g);b.style.display="none",this.clear();for(var j=0;e>j;j++)for(var k=0;e>k;k++){var l=a.isDark(j,k),m=k*f,n=j*g;c.strokeStyle=l?d.colorDark:d.colorLight,c.lineWidth=1,c.fillStyle=l?d.colorDark:d.colorLight,c.fillRect(m,n,f,g),c.strokeRect(Math.floor(m)+.5,Math.floor(n)+.5,h,i),c.strokeRect(Math.ceil(m)-.5,Math.ceil(n)-.5,h,i)}this._bIsPainted=!0},e.prototype.makeImage=function(){this._bIsPainted&&d.call(this,a)},e.prototype.isPainted=function(){return this._bIsPainted},e.prototype.clear=function(){this._oContext.clearRect(0,0,this._elCanvas.width,this._elCanvas.height),this._bIsPainted=!1},e.prototype.round=function(a){return a?Math.floor(1e3*a)/1e3:a},e}():function(){var a=function(a,b){this._el=a,this._htOption=b};return a.prototype.draw=function(a){for(var b=this._htOption,c=this._el,d=a.getModuleCount(),e=Math.floor(b.width/d),f=Math.floor(b.height/d),g=['<table style="border:0;border-collapse:collapse;">'],h=0;d>h;h++){g.push("<tr>");for(var i=0;d>i;i++)g.push('<td style="border:0;border-collapse:collapse;padding:0;margin:0;width:'+e+"px;height:"+f+"px;background-color:"+(a.isDark(h,i)?b.colorDark:b.colorLight)+';"></td>');g.push("</tr>")}g.push("</table>"),c.innerHTML=g.join("");var j=c.childNodes[0],k=(b.width-j.offsetWidth)/2,l=(b.height-j.offsetHeight)/2;k>0&&l>0&&(j.style.margin=l+"px "+k+"px")},a.prototype.clear=function(){this._el.innerHTML=""},a}();QRCode=function(a,b){if(this._htOption={width:256,height:256,typeNumber:4,colorDark:"#000000",colorLight:"#ffffff",correctLevel:d.H},"string"==typeof b&&(b={text:b}),b)for(var c in b)this._htOption[c]=b[c];"string"==typeof a&&(a=document.getElementById(a)),this._android=n(),this._el=a,this._oQRCode=null,this._oDrawing=new q(this._el,this._htOption),this._htOption.text&&this.makeCode(this._htOption.text)},QRCode.prototype.makeCode=function(a){this._oQRCode=new b(r(a,this._htOption.correctLevel),this._htOption.correctLevel),this._oQRCode.addData(a),this._oQRCode.make(),this._el.title=a,this._oDrawing.draw(this._oQRCode),this.makeImage()},QRCode.prototype.makeImage=function(){"function"==typeof this._oDrawing.makeImage&&(!this._android||this._android>=3)&&this._oDrawing.makeImage()},QRCode.prototype.clear=function(){this._oDrawing.clear()},QRCode.CorrectLevel=d}();]]>
                </script>

	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Florit Web Tasarın e-Arşiv Faturanız</title>
<style type="text/css">
					.ph {overflow:hidden;max-height:250px;}
					.ph7 {text-align:center;margin-bottom:18px;}
					.ph8 img {margin-bottom: 18px;}
					.ph10 {
						float: left;
						width: 295px;
						margin-top: 14px;
						margin-right: 12px;
						padding: 8px;
					}

					body {
						margin: 7px 0 10px 0;
						text-align: center;
						background-color: #BBBBBB;
						font-family:Arial, Helvetica, sans-serif;
						background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAYAAADgKtSgAAABCElEQVR42p1VWw7DIAzL/S/Z10E2pZKRZ8UB9oEKxaSJbdJ4nudzHMcYucY73VvB5Po8z3ce13UNMB/SAdzOXtz33WaGwzlyXuHzHfDAvcGrA1ryLj2YhwvaacFUgF/O2gbXIFwVzzt9Bi1OTDdXR/C+VhFdgB3K+IkKY8XnSlNmqB+rqg8+xJ5ncWbcMg62zASiysxVoTp0exknVqw349hVEaq647zyuDPACD7LqhJu9aZG9cXO9xBsdg9+3AKFXa9gB610xpcW7WTVgIM0ASdmSYvLmC+Po2VLUCcyV8F9vAzeZbvbzLR5hevFDKrWjOO/EKr5uaH//IAVx3oMWhg847167yz8BYJMf2ivVbLJAAAAAElFTkSuQmCC);
					}
					.documentContainer a {pointer-events:none;}
					.documentContainer,
					.documentContainerOuter {
							margin: 0 auto;
							}
					@media screen {
					body {color: #666;}
					.documentContainer {
							max-width: 945px;
							min-width: 945px;
							overflow:hidden;
							text-align: left;
							box-sizing: border-box;
							display:inline-block;
							-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
							-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
							box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
							background-color: white;
							position: relative;
							padding: 20px 20px 20px 28px;
						}
					
					.documentContainer:before, .documentContainer:after {
						content: "";
						position: absolute;
						z-index: -1;
						-webkit-box-shadow: 0 0 20px rgba(0,0,0,0.8);
						-moz-box-shadow: 0 0 20px rgba(0,0,0,0.8);
						box-shadow: 0 0 20px rgba(0,0,0,0.8);
						top: 50%;
						bottom: 0;
						left: 10px;
						right: 10px;
						-moz-border-radius: 100px / 10px;
						border-radius: 100px / 10px;
					}

					.documentContainer:after {
						right: 10px;
						left: auto;
						-webkit-transform: skew(8deg) rotate(3deg);
						-moz-transform: skew(8deg) rotate(3deg);
						-ms-transform: skew(8deg) rotate(3deg);
						-o-transform: skew(8deg) rotate(3deg);
						transform: skew(8deg) rotate(3deg);
					}
					}	

					#ustBolum{
						margin-top: 27px;
						margin-bottom: 15px;
					}
						.kutu {vertical-align: top;}
						
						.kutu table{float:none;}
						.gonderici {
							display: inline-block;
							padding: 8px 8px 8px 0;
							box-sizing: border-box;
						}
						.gonderici .partyName {font-weight:bold;}
						.alici {
							width: 370px;
							padding: 8px 4px 4px 0;
							box-sizing: border-box;
						}
						.alici .customerTitle {font-weight:bold;}
						.alici .kutu { border:1px solid #CCC; background-color:#F4F4F4;}
						
						#ETTN {
							margin-top: 7px;
							padding: 8px 4px 4px 0;
						}

						#despatchTable .placeHolder.companyLogo img {margin-bottom:18px;}
						
						#toplamlarContainer {overflow:hidden;}
						.toplamlar {float:right;width: 100%;}
						.toplamlar tr {text-align:right;}
						.toplamlar th {font-weight:normal;text-align:right;}
						.toplamlar table {width:238px;margin-top: 14px;border-spacing:0;}
						.toplamlar table td {font-weight: bold; width:25%; white-space:nowrap;min-width: 55px; vertical-align: top;
						}
						.toplamlar table th,
						.toplamlar table td{
							border-bottom: 1px solid #ccc;
							border-right: 1px solid #ccc;
							border-left: 1px solid #ccc;
							padding:3px;
						}
						.toplamlar table th {white-space:nowrap;border-right: none;}
						.toplamlar table th.is-long-true,
						#malHizmetTablosu > tbody > tr > td .is-long-true {white-space:pre-line;}
						.toplamlar table tr:first-child th,
						.toplamlar table tr:first-child td{
						border-top:1px solid #ccc;
						}
						.toplamlar table td span {font-weight:normal;color: #7C7C7C;}

						tr.payableAmount th:first-child {
							background-color: #f6f6f6;
						}

						tr.payableAmount td {
						background-color: #f6f6f6;
						}

						.toplamlar > div {
							display: inline-block;
						}
						.toplamTablo{
							margin-left: 31px;
							float:right;
						}
					#notlar {
						margin-top: 14px;
						border-top: 1px solid #DDD;
						overflow: hidden;
						padding-top: 8px;
						padding-bottom: 2px;

					}
					#notlar table {border:none;background:none;}
					.clearfix:before,
					.clearfix:after {
						content:"";
						display:table;
					}

					.box{display: inline-block;*display: inline;zoom: 1;width: 33%; box-sizing:border-box; vertical-align: top;}
					#b1{width: 40%;}
					#b2{width: 25%;}
					#b3{width: 35%;}
					#kunye {border-spacing:0;}
					#kunye tr{ border-bottom: 1px dotted #CCC;}
					#kunye td{ border:1px solid #CCC;border-top: none;padding:3px;width: 100%;}
					#kunye th{vertical-align:top;font-weight:bold;padding:3px;white-space: nowrap;border:1px solid #ccc;border-top: none;border-right: none;text-align:left;}
					#kunye tr:first-child td{border-top: 1px solid #ccc;}
					#kunye tr:first-child th{border-top: 1px solid #ccc;}
					#kunye td:nth-child(2) {word-break: break-all;}
					.satirlar {margin-top:20px;}
					#malHizmetTablosu
					{
						width:100%;
						font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
						background: #fff;
						border-collapse: collapse;
						text-align: right;
					}
					#malHizmetTablosu > tbody > tr > th
					{
						font-weight: normal;
						padding: 2px;
						text-align:right;
						color: black;
						padding-left: 3px;
						border-bottom: 2px solid #AAAAAA;
						background-color: #DFDFDF;
						border-right: 1px solid #B8B8B8;
						border-top: 1px solid #C5C5C5;
						padding-right: 5px;
						vertical-align: middle;
						min-height: 35px;
					}					
					#malHizmetTablosu > tbody > tr:first-child > th:first-child {border-left: 1px solid #B8B8B8;}
					#malHizmetTablosu > tbody > tr:first-child > th.mhColumn {min-width:72px;}
					#malHizmetTablosu > tbody > th > .thTopTitle {text-align:center;width: 89px;}
					#malHizmetTablosu > tbody > th .thSubTitle {width: 47px; display: inline-block;text-align: right;}
					#malHizmetTablosu > tbody > th .thSubTitle.HF {width:36px;}
					#malHizmetTablosu > tbody > tr > th.alignLeft {text-align:left;width: 50%;}

					#malHizmetTablosu > tbody > tr > td {
						padding-left:3px;
						border-bottom: 1px solid #ccc;
						color: #000;
						border-right: 1px solid #ccc;
						padding-right: 3px;
						text-align:right;
						height:25px;
					}
					#malHizmetTablosu > tbody > tr > td.iskontoOrani {padding-left:0; padding-right:0;}
					#malHizmetTablosu > tbody > tr > td.iskontoOrani td{text-align: center;}
					#malHizmetTablosu > tbody > tr:hover > td {border-right: 1px solid #969696;border-bottom: 1px solid #969696;border-top: 1px solid #969696;}
					#malHizmetTablosu > tbody > tr > td.wrap {white-space:normal;text-align:left;}
					#malHizmetTablosu > tbody > tr > td:first-child,
					#malHizmetTablosu > tbody > tr > th:first-child {border-left: 1px solid #B8B8B8;}

					#malHizmetTablosu > tbody > tr:hover > td
					{
						background-color: #D1D1D1 !important;
						cursor:default;
					}
					#malHizmetTablosu > tbody > tr:nth-child(even) > td {background-color: #FFF}
					#malHizmetTablosu > tbody > tr:nth-child(odd) > td {background-color: #EEE}
					.sumValue {white-space:nowrap;}
					.iskontoOraniHeader,
					.iskontoOraniDegerler {width:100%;border-spacing:0;}
					.iskontoOraniHeader td {border-top: 1px solid #969696;}
					.iskontoOraniHeader td,
					.iskontoOraniDegerler td
					{border-left: 1px solid #969696;}
					.iskontoOraniHeader td:first-child,
					.iskontoOraniDegerler td:first-child {border-left:none;}
					@media print {
						body {color: #000;text-align: left;background:none;background-color:#ffffff;margin:0;}
						.documentContainer {padding:0;min-height: initial;width: 845px !important;}
						#malHizmetTablosu {width: 845px;}
					}
					
					body,table{font-size:12px;}

</style>

</head>
	<body>
			<div class="documentContainerOuter">
				<div class="documentContainer">
	<xsl:for-each select="$XML">
						<div id="ustBolum">
									<div id="b1" class="box"> 
										<div id="AccountingSupplierParty" class="gonderici kutu">
																	<xsl:for-each select="n1:Invoice">
									<xsl:for-each select="cac:AccountingSupplierParty">
									<xsl:for-each select="cac:Party">
									<div class="partyName">
									<xsl:if test="not(cac:Person/cbc:FirstName ='') or not(cac:Person/cbc:FamilyName ='')">
										<xsl:for-each select="cac:Person">
										<xsl:for-each select="cbc:Title">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:FirstName">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:MiddleName">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:FamilyName">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:NameSuffix">
										<xsl:apply-templates/>
										</xsl:for-each>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:if test="not(cac:PartyName/cbc:Name ='')">
										<xsl:value-of select="cac:PartyName/cbc:Name"/>
									</xsl:if>
									</div>
									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									
									<xsl:for-each select="n1:Invoice">
									<xsl:for-each select="cac:AccountingSupplierParty">
									<xsl:for-each select="cac:Party">
									<div class="addres">
									<xsl:for-each select="cac:PostalAddress">
									<xsl:for-each select="cbc:Region">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<xsl:for-each select="cbc:StreetName">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<xsl:for-each select="cbc:BuildingName">
									<xsl:apply-templates/>
									</xsl:for-each>
									<xsl:if test="cbc:BuildingNumber">
									<span>
									<xsl:text> No:</xsl:text>
									</span>
									<xsl:for-each select="cbc:BuildingNumber">
									<xsl:apply-templates/>
									</xsl:for-each>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:if>
									<xsl:for-each select="cbc:Room">
									<span>
									<xsl:text>Kapı No:</xsl:text>
									</span>
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>

									<xsl:if test="cbc:District !=''">
									<xsl:for-each select="cbc:District">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<br/>
									</xsl:if>
									
									<xsl:if test="cbc:PostalZone != '' ">
										<xsl:for-each select="cbc:PostalZone">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
									</xsl:if>
									<xsl:for-each select="cbc:CitySubdivisionName">
									<xsl:apply-templates/>
									</xsl:for-each>
									<span>
									<xsl:text> / </xsl:text>
									</span>
									<xsl:for-each select="cbc:CityName">
									<xsl:apply-templates/>
									</xsl:for-each>
									</xsl:for-each>
									</div>
									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									
									<div class="taxOffice">
										<xsl:text>Vergi Dairesi: </xsl:text>
										<xsl:value-of
										select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name"
										/>
									</div>
									
								<xsl:for-each
								select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
								<xsl:if test="@schemeID != 'MUSTERINO'">
								<div class="partyID">
									<xsl:choose>
										<xsl:when test="@schemeID = 'TICARETSICILNO'">
											<xsl:text>Ticaret Sicil No</xsl:text>
										</xsl:when>
										<xsl:when test="@schemeID = 'MERSISNO'">
											<xsl:text>MERSİS No</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@schemeID"/>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text>: </xsl:text>
									<xsl:value-of select="."/>
								</div>
								</xsl:if>
								</xsl:for-each>
								
								
								<div class="ph empty ph2">
								<xsl:text disable-output-escaping="yes"><![CDATA[<strong>TEL:</strong> +90 555 249 9439 (MUHAMMET ŞENLİK)<br/><strong>E-POSTA:</strong> info@floritweb.com<br/><strong>WEB:</strong> floritweb.com
]]></xsl:text>
								</div>

						</div>
						
						<div class="alici kutu">
														<div class="customerTitle">
									<xsl:text>SAYIN</xsl:text>
								</div>
								
								<div class="partyName">
									<xsl:for-each select="n1:Invoice">
									<xsl:for-each select="cac:AccountingCustomerParty">
									<xsl:for-each select="cac:Party">
									<div class="partyName">
									<xsl:if test="not(cac:Person/cbc:FirstName ='') or not(cac:Person/cbc:FamilyName ='')">
										<xsl:for-each select="cac:Person">
										<xsl:for-each select="cbc:Title">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:FirstName">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:MiddleName">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:FamilyName">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
										<xsl:for-each select="cbc:NameSuffix">
										<xsl:apply-templates/>
										</xsl:for-each>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:if test="not(cac:PartyName/cbc:Name ='')">
										<xsl:value-of select="cac:PartyName/cbc:Name"/>
									</xsl:if>
									</div>
									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</div>	
								
								<div class="addres">
									<xsl:for-each select="n1:Invoice">
									<xsl:for-each select="cac:AccountingCustomerParty">
									<xsl:for-each select="cac:Party">
									<xsl:for-each select="cac:PostalAddress">
									<xsl:for-each select="cbc:Region">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<xsl:if test="cbc:StreetName !=''">
									<xsl:for-each select="cbc:StreetName">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									</xsl:if>

									<xsl:for-each select="cbc:BuildingName">
									<xsl:apply-templates/>
									</xsl:for-each>
									<xsl:if test="cbc:BuildingNumber !=''">
									<xsl:for-each select="cbc:BuildingNumber">
									<span>
									<xsl:text> No:</xsl:text>
									</span>
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<br/>
									</xsl:if>

									<xsl:if test="cbc:Room !=''">
									<xsl:for-each select="cbc:Room">
									<span>
									<xsl:text>Kapı No:</xsl:text>
									</span>
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<br/>
									</xsl:if>

									<xsl:if test="cbc:District !=''">
									<xsl:for-each select="cbc:District">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									<br/>
									</xsl:if>

									<xsl:if test="cbc:PostalZone != '' ">
										<xsl:for-each select="cbc:PostalZone">
										<xsl:apply-templates/>
										<span>
										<xsl:text>&#160;</xsl:text>
										</span>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="cbc:CitySubdivisionName != '' ">
									<xsl:for-each select="cbc:CitySubdivisionName">
									<xsl:apply-templates/>
									<span>
									<xsl:text>/ </xsl:text>
									</span>
									</xsl:for-each>
									</xsl:if>
									
									<xsl:if test="cbc:CityName != ''">
									<xsl:for-each select="cbc:CityName">
									<xsl:apply-templates/>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									</xsl:if>
									</xsl:for-each>

									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
								</div> 
								
<xsl:if test="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone !='' or //n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax !=''">
									<xsl:for-each select="n1:Invoice">
									<xsl:for-each select="cac:AccountingCustomerParty">
									<xsl:for-each select="cac:Party">
									<div class="telFax">
									<xsl:for-each select="cac:Contact">
									<xsl:if test="cbc:Telephone !=''">
									<span>
									<xsl:text>Tel: </xsl:text>
									</span>
									<xsl:for-each select="cbc:Telephone">
									<xsl:apply-templates/>
									</xsl:for-each>
									</xsl:if>
									<xsl:if test="cbc:Telefax !=''">
									<span>
									<xsl:text> Faks: </xsl:text>
									</span>
									<xsl:for-each select="cbc:Telefax">
									<xsl:apply-templates/>
									</xsl:for-each>
									</xsl:if>
									<span>
									<xsl:text>&#160;</xsl:text>
									</span>
									</xsl:for-each>
									</div>
									</xsl:for-each>
									</xsl:for-each>
									</xsl:for-each>
									
</xsl:if> 
<xsl:if test="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI != ''">
								<xsl:for-each
								select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI">
								<div class="WebsiteURI">
									<xsl:text>Web Sitesi: </xsl:text>
									<xsl:value-of select="."/>
								</div>
								</xsl:for-each>
								
</xsl:if> 
<xsl:if test="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail != ''">
								<xsl:for-each
								select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
								<div class="eMail">
									<xsl:text>e-Posta: </xsl:text>
									<xsl:value-of select="."/>
								</div>
								</xsl:for-each>
								
</xsl:if> 
									<div class="taxOffice">
										<xsl:text>Vergi Dairesi: </xsl:text>
										<xsl:value-of
										select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name"
										/>
									</div>
									
								<xsl:for-each
								select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification">
								<div class="partyID">
									<xsl:choose>
										<xsl:when test="cbc:ID/@schemeID = 'TICARETSICILNO'">
											<xsl:text>Ticaret Sicil No</xsl:text>
										</xsl:when>
										<xsl:when test="cbc:ID/@schemeID = 'MERSISNO'">
											<xsl:text>MERSİS No</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="cbc:ID/@schemeID"/>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text>: </xsl:text>
									<xsl:value-of select="cbc:ID"/>
								</div>
								</xsl:for-each>
								

						</div>
    <div id="ETTN"> 
						<span style="font-weight:bold; ">
							<xsl:text>ETTN: </xsl:text>
						</span>
						<xsl:for-each select="n1:Invoice">
							<xsl:for-each select="cbc:UUID">
							<xsl:apply-templates/>
							</xsl:for-each>
						</xsl:for-each>
		</div> 


				</div> 
<div id="b2" class="box"> 
					
								<div class="ph empty ph6">
								<xsl:text disable-output-escaping="yes"><![CDATA[<div><img style="display: block; margin-left: auto; margin-right: auto;" src="data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzMiA3OS4xNTkyODQsIDIwMTYvMDQvMTktMTM6MTM6NDAgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjZDNDJBNEI2QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjZDNDJBNEI1QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzREVENkU1N0FDREVDNEJBNzkxNUM2M0NCN0RENzM0NyIgc3RSZWY6ZG9jdW1lbnRJRD0iM0RFRDZFNTdBQ0RFQzRCQTc5MTVDNjNDQjdERDczNDciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB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" alt="e-Arşiv Fatura Logo" width="86" height="84" align="middle"/></div>
<div style="text-align: center;"><span style="font-size: 11pt; font-weight: bold;">e-Arşiv Fatura<br/><img src="data:image/jpeg;base64,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" alt="" width="193" height="136"/><br/></span></div>
]]></xsl:text>
								</div>

</div> 
	<div id="b3" class="box">


	<div id="qrcode"/>

	<div id="qrvalue" style="visibility: hidden">
{"vkntckn":"<xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='TCKN' or @schemeID='VKN']"/>",
"avkntckn":"<xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='TCKN' or @schemeID='VKN']"/>",
"senaryo":"<xsl:value-of select="n1:Invoice/cbc:ProfileID"/>",
"tip":"<xsl:value-of select="n1:Invoice/cbc:InvoiceTypeCode"/>",
"tarih":"<xsl:value-of select="n1:Invoice/cbc:IssueDate"/>",
"no":"<xsl:value-of select="n1:Invoice/cbc:ID"/>",
"ettn":"<xsl:value-of select="n1:Invoice/cbc:UUID"/>",
"paraBirimi":"<xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>",
"malhizmettoplam":"<xsl:value-of select="n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount"/>",<xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015']">
"kdvmatrah(<xsl:value-of select="cbc:Percent"/>)":"<xsl:value-of select="(./cbc:TaxableAmount[../cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode='0015'])"/>",</xsl:for-each>
		<xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '0015']">        
"hesaplanankdv(<xsl:value-of select="cbc:Percent"/>)":"<xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
				<xsl:value-of select="(../../cbc:TaxAmount)"/>", </xsl:for-each>
		</xsl:for-each>             
"vergidahil":"<xsl:value-of select="n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount"/>",
"odenecek":"<xsl:value-of select="n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount"/>"}
	</div>
	<script type="text/javascript">
										var qrcode = new QRCode(document.getElementById("qrcode"), {
										width : 150,
										height : 150,
										correctLevel : QRCode.CorrectLevel.M
										});

										function makeCode (msg) {		
										var elText = document.getElementById("text");

										qrcode.makeCode(msg);
										}

										makeCode(document.getElementById("qrvalue").innerHTML);
	</script>	

	<div id="despatchTable" style="margin-top:-100px">
				<div class="ph empty ph7">
		<xsl:text disable-output-escaping="yes"><![CDATA[<img src="data:image/jpeg;base64,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AAAAGAMAAGQCAAAAAcADAACwBAAAAQAPJwEALgBqAHAAZQBnAAAAcAA4QklNA+0AAAAAABAASAAAAAEAAgBIAAAAAQACOEJJTQQmAAAAAAAOAAAAAAAAAAAAAD+AAAA4QklNBA0AAAAAAAQAAAAeOEJJTQQZAAAAAAAEAAAAHjhCSU0D8wAAAAAACQAAAAAAAAAAAQA4QklNBAoAAAAAAAEAADhCSU0nEAAAAAAACgABAAAAAAAAAAI4QklNA/UAAAAAAEgAL2ZmAAEAbGZmAAYAAAAAAAEAL2ZmAAEAoZmaAAYAAAAAAAEAMgAAAAEAWgAAAAYAAAAAAAEANQAAAAEALQAAAAYAAAAAAAE4QklNA/gAAAAAAHAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAOEJJTQQIAAAAAAAQAAAAAQAAAkAAAAJAAAAAADhCSU0EHgAAAAAABAAAAAA4QklNBBoAAAAAA1UAAAAGAAAAAAAAAAAAAABBAAAAyAAAABAAZgBsAG8AcgBpAHQALQBsAG8AZwBvAC4AagBwAGUAZwAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAyAAAAEEAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAQAAAAAAAG51bGwAAAACAAAABmJvdW5kc09iamMAAAABAAAAAAAAUmN0MQAAAAQAAAAAVG9wIGxvbmcAAAAAAAAAAExlZnRsb25nAAAAAAAAAABCdG9tbG9uZwAAAEEAAAAAUmdodGxvbmcAAADIAAAABnNsaWNlc1ZsTHMAAAABT2JqYwAAAAEAAAAAAAVzbGljZQAAABIAAAAHc2xpY2VJRGxvbmcAAAAAAAAAB2dyb3VwSURsb25nAAAAAAAAAAZvcmlnaW5lbnVtAAAADEVTbGljZU9yaWdpbgAAAA1hdXRvR2VuZXJhdGVkAAAAAFR5cGVlbnVtAAAACkVTbGljZVR5cGUAAAAASW1nIAAAAAZib3VuZHNPYmpjAAAAAQAAAAAAAFJjdDEAAAAEAAAAAFRvcCBsb25n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c2hvcCBDUzMgV2luZG93cyIgZGM6Zm9ybWF0PSJpbWFnZS9qcGVnIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiBwaG90b3Nob3A6SGlzdG9yeT0iIiB4YXBNTTpJbnN0YW5jZUlEPSJ1dWlkOjY2NTAwMEYxOUIwMUVDMTE4NjA3RjQ2MDAxRUE3QTJEIiB4YXBNTTpEb2N1bWVudElEPSJ1dWlkOjY1NTAwMEYxOUIwMUVDMTE4NjA3RjQ2MDAxRUE3QTJEIiB0aWZmOk9yaWVudGF0aW9uPSIxIiB0aWZmOlhSZXNvbHV0aW9uPSI3MjAwMDAvMTAwMDAiIHRpZmY6WVJlc29sdXRpb249IjcyMDAwMC8xMDAwMCIgdGlmZjpSZXNvbHV0aW9uVW5pdD0iMiIgdGlmZjpOYXRpdmVEaWdlc3Q9IjI1NiwyNTcsMjU4LDI1OSwyNjIsMjc0LDI3NywyODQsNTMwLDUzMSwyODIsMjgzLDI5NiwzMDEsMzE4LDMxOSw1MjksNTMyLDMwNiwyNzAsMjcxLDI3MiwzMDUsMzE1LDMzNDMyO0JENTk0M0ZGNjMxMjVGODIwOTVGQzhCQTE0MEYzQjY0IiBleGlmOlBpeGVsWERpbWVuc2lvbj0iMjAwIiBleGlmOlBpeGVsWURpbWVuc2lvbj0iNjUiIGV4aWY6Q29sb3JTcGFjZT0iLTEiIGV4aWY6TmF0aXZlRGlnZXN0PSIzNjg2NCw0MDk2MCw0MDk2MSwzNzEyMSwzNzEyMiw0MDk2Miw0MDk2MywzNzUxMCw0MDk2NCwzNjg2NywzNjg2OCwzMzQzNCwzMzQzNywzNDg1MCwzNDg1MiwzNDg1NSwzNDg1NiwzNzM3NywzNzM3OCwzNzM3OSwzNzM4MCwzNzM4MSwzNzM4MiwzNzM4MywzNzM4NCwzNzM4NSwzNzM4NiwzNzM5Niw0MTQ4Myw0MTQ4NCw0MTQ4Niw0MTQ4Nyw0MTQ4OCw0MTQ5Miw0MTQ5Myw0MTQ5NSw0MTcyOCw0MTcyOSw0MTczMCw0MTk4NSw0MTk4Niw0MTk4Nyw0MTk4OCw0MTk4OSw0MTk5MCw0MTk5MSw0MTk5Miw0MTk5Myw0MTk5NCw0MTk5NSw0MTk5Niw0MjAxNiwwLDIsNCw1LDYsNyw4LDksMTAsMTEsMTIsMTMsMTQsMTUsMTYsMTcsMTgsMjAsMjIsMjMsMjQsMjUsMjYsMjcsMjgsMzA7Q0FFMUE4MDVFQkY4MzQ1MkU1NTg0RDc2RTRDNzM5MTkiPiA8eGFwTU06RGVyaXZlZEZyb20gcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPD94cGFja2V0IGVuZD0idyI/Pv/uAA5BZG9iZQBkQAAAAAH/2wCEAAQDAwMDAwQDAwQGBAMEBgcFBAQFBwgGBgcGBggKCAkJCQkICgoMDAwMDAoMDAwMDAwMDAwMDAwMDAwMDAwMDAwBBAUFCAcIDwoKDxQODg4UFA4ODg4UEQwMDAwMEREMDAwMDAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDP/AABEIAEEAyAMBEQACEQEDEQH/3QAEABn/xAGiAAAABwEBAQEBAAAAAAAAAAAEBQMCBgEABwgJCgsBAAICAwEBAQEBAAAAAAAAAAEAAgMEBQYHCAkKCxAAAgEDAwIEAgYHAwQCBgJzAQIDEQQABSESMUFRBhNhInGBFDKRoQcVsUIjwVLR4TMWYvAkcoLxJUM0U5KismNzwjVEJ5OjszYXVGR0w9LiCCaDCQoYGYSURUaktFbTVSga8uPzxNTk9GV1hZWltcXV5fVmdoaWprbG1ub2N0dXZ3eHl6e3x9fn9zhIWGh4iJiouMjY6PgpOUlZaXmJmam5ydnp+So6SlpqeoqaqrrK2ur6EQACAgECAwUFBAUGBAgDA20BAAIRAwQhEjFBBVETYSIGcYGRMqGx8BTB0eEjQhVSYnLxMyQ0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" alt="" width="200" height="65"/><br/>      <strong>WEB HİZMETLERİ</strong>
]]></xsl:text>
		</div>
	<div style="clear:both;"></div>
		<table id="kunye">
			<tbody>
													<tr>
											<th>
												<xsl:text>Tarih:</xsl:text>
											</th>
											<td>
											<xsl:for-each select="n1:Invoice">
											<xsl:for-each select="cbc:IssueDate">
											<xsl:value-of select="substring(.,9,2)"
											/>-<xsl:value-of select="substring(.,6,2)"
											/>-<xsl:value-of select="substring(.,1,4)"/>
											</xsl:for-each>
											</xsl:for-each>
											</td>
										</tr>
											<tr>
											<th>
												<xsl:text>Fatura No:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="n1:Invoice">
												<xsl:for-each select="cbc:ID">
												<xsl:apply-templates/>
												</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<th style="width:105px;">
												<xsl:text>Özelleştirme No:</xsl:text>
											</th>
											<td style="width:110px;">
												<xsl:for-each select="n1:Invoice">
												<xsl:for-each select="cbc:CustomizationID">
												<xsl:apply-templates/>
												</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<th>
												<xsl:text>Senaryo:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="n1:Invoice">
												<xsl:for-each select="cbc:ProfileID">
												<xsl:apply-templates/>
												</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<th>
												<xsl:text>Fatura Tipi:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="n1:Invoice">
												<xsl:for-each select="cbc:InvoiceTypeCode">
												<xsl:apply-templates/>
												</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
<xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'İade Edilen Fatura'] or //n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
								<xsl:choose>
									<xsl:when test="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
										<tr>
											<th style="vertical-align:top;">
												<xsl:text>İade Fatura No:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
												<xsl:if test="position() !=1"><br/></xsl:if>
												<xsl:value-of select="cbc:ID"/>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<th style="vertical-align:top;">
												<xsl:text>İade Fatura Tarihi:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
												<xsl:if test="position() !=1"><br/></xsl:if>
												<xsl:value-of select="substring(cbc:IssueDate,9,2)"
												/>-<xsl:value-of select="substring(cbc:IssueDate,6,2)"
												/>-<xsl:value-of select="substring(cbc:IssueDate,1,4)"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:when>
									<xsl:when test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
										<tr>
											<th style="vertical-align:top;">
												<xsl:text>İade Fatura No:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
												<xsl:if test="position() !=1"><br/></xsl:if>
												<xsl:value-of select="cbc:ID"/>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<th style="vertical-align:top;">
												<xsl:text>İade Fatura Tarihi:</xsl:text>
											</th>
											<td>
												<xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
												<xsl:if test="position() !=1"><br/></xsl:if>
												<xsl:value-of select="substring(cbc:IssueDate,9,2)"
												/>-<xsl:value-of select="substring(cbc:IssueDate,6,2)"
												/>-<xsl:value-of select="substring(cbc:IssueDate,1,4)"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:when>
								</xsl:choose>
</xsl:if> 
<xsl:if test="//n1:Invoice/cbc:IssueTime">
											<tr>
												<th>
													<xsl:text>Oluşma Zamanı:</xsl:text>
												</th>
												<td>
													<xsl:value-of select="//n1:Invoice/cbc:IssueTime"/>
												</td>
											</tr>
</xsl:if> 

			</tbody>
		</table>

	</div> 
	</div> 

					</div> 
					<div class="satirlar"> 
						
					<table id="malHizmetTablosu">
						<tbody>
							<tr>
															<th data-id="SATIRLAR_SIRANO">
									<xsl:text>Sıra No</xsl:text>
								</th>
								<th data-id="SATIRLAR_MALHIZMET" class="alignLeft">
									<xsl:text>Mal Hizmet</xsl:text>
								</th>
								<th data-id="SATIRLAR_MIKTAR">
									<xsl:text>Miktar</xsl:text>
								</th>
								<th data-id="SATIRLAR_BIRIMFIYAT">
									<xsl:text>Birim Fiyat</xsl:text>
								</th>
								<th data-id="SATIRLAR_MHTUTARI" class="mhColumn">
									<xsl:text>Mal Hizmet Tutarı</xsl:text>
								</th>
<xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
								<th data-id="SATIRLAR_KDVORANI">
									<xsl:text>KDV Oranı</xsl:text>
								</th>
</xsl:if> 

							</tr>
								<xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
				</div>

	</xsl:for-each> 
			<div id="toplamlarContainer">
						<div class="toplamlar">
			<div class="toplamTablo">

<table id="toplamlar">
	<tbody>
				<tr>
			<th>
				<xsl:text>Mal Hizmet Toplam Tutarı:</xsl:text>
			</th>
			<td>
				<xsl:value-of
									select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount, '###.##0,00', 'european')"/>
				<xsl:if
									test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID">
					<xsl:text> </xsl:text>
					<span>
						<xsl:if
										test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
							<xsl:text>TL</xsl:text>
						</xsl:if>
						<xsl:if
										test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
							<xsl:value-of
											select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID"
										/>
						</xsl:if>
					</span>
				</xsl:if>
			</td>
		</tr>
                <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[not(starts-with(./cac:TaxCategory/cbc:TaxExemptionReasonCode,'8') and (string-length(./cac:TaxCategory/cbc:TaxExemptionReasonCode) =3))]">
                        <tr>

                                <th class="sumTitle is-long-{string-length(cac:TaxCategory/cac:TaxScheme/cbc:Name) > 15}">
                                        <xsl:text>Hesaplanan </xsl:text>
                                        <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                        <xsl:text> (%</xsl:text>
                                        <xsl:value-of select="cbc:Percent"/>
                                        <xsl:text>) </xsl:text>
                                        <xsl:if test="cac:TaxCategory/cbc:TaxExemptionReasonCode > 0">
                                                        (<xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>)
                                        </xsl:if>
                                        <xsl:text>: </xsl:text>
                                </th>
                                <td class="sumValue">
                                        <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of
                                                                        select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                                                <span>
                                                        <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                                                <xsl:text> </xsl:text>
                                                                <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                        <xsl:text>TL</xsl:text>
                                                                </xsl:if>
                                                                <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                        <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                                                </xsl:if>
                                                        </xsl:if>
                                                </span>
                                        </xsl:for-each>
                                </td>
                        </tr>
                </xsl:for-each>
                <tr>
                        <th>
                                <xsl:text>Vergiler Dahil Toplam Tutar:</xsl:text>
                        </th>
                        <td class="sumValue">
                                <xsl:for-each select="n1:Invoice">
                                        <xsl:for-each select="cac:LegalMonetaryTotal">
                                                <xsl:for-each select="cbc:TaxInclusiveAmount">
                                                        <xsl:value-of
                                                                                        select="format-number(., '###.##0,00', 'european')"/>
                                                        <xsl:if
                                                                                        test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID">
                                                                <xsl:text> </xsl:text>
                                                                <span>
                                                                        <xsl:if
                                                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                                <xsl:text>TL</xsl:text>
                                                                        </xsl:if>
                                                                        <xsl:if
                                                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                                <xsl:value-of
                                                                                                select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID"
                                                                                                />
                                                                        </xsl:if>
                                                                </span>
                                                        </xsl:if>
                                                </xsl:for-each>
                                        </xsl:for-each>
                                </xsl:for-each>
                        </td>
                </tr>
                <tr class="payableAmount">
                        <th>
                                <xsl:text>Ödenecek Tutar:</xsl:text>
                        </th>
                        <td>
                                <xsl:for-each select="n1:Invoice">
                                        <xsl:for-each select="cac:LegalMonetaryTotal">
                                                <xsl:for-each select="cbc:PayableAmount">
                                                        <xsl:value-of
                                                                                        select="format-number(., '###.##0,00', 'european')"/>
                                                        <xsl:if
                                                                                        test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID">
                                                                <xsl:text> </xsl:text>
                                                                <span>
                                                                        <xsl:if
                                                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                                <xsl:text>TL</xsl:text>
                                                                        </xsl:if>
                                                                        <xsl:if
                                                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                                <xsl:value-of
                                                                                                select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID"
                                                                                                />
                                                                        </xsl:if>
                                                                </span>
                                                        </xsl:if>
                                                </xsl:for-each>
                                        </xsl:for-each>
                                </xsl:for-each>
                        </td>
                </tr>

	</tbody>
</table>
</div>


			</div>

			</div>
				<div class="ph empty ph11">
				<xsl:text disable-output-escaping="yes"><![CDATA[<strong>IBAN (TL)</strong>: TR61 0020 3000 0914 6672 0000 01<br/><strong>HESAP SAHİBİ:</strong> SEFA ŞENLİK<br/><strong>BANKA ADI:</strong> ALBARAKA TÜRK BANKASI / DENİZLİ SANAYİ ŞB.]]></xsl:text>
				</div>
				<div id="notlar"> 
				<table>
					<tbody>
						<tr>
							<td>
								<xsl:for-each select="//n1:Invoice/cbc:Note">
									<xsl:if test="1=1">
										<xsl:call-template name="repNL">
											<xsl:with-param name="pText" select="." />
										</xsl:call-template>
									</xsl:if>
								</xsl:for-each>
								<div class="ekNot">
									<xsl:if test ="n1:Invoice/cbc:Note[contains(normalize-space(.),'Gönderim Şekli:ELEKTRONIK')] or n1:Invoice/cbc:Note[contains(normalize-space(.),'Gönderim Şekli: ELEKTRONIK')]">
									<span>e-Arşiv izni kapsamında elektronik ortamda iletilmiştir.</span><br/>
									</xsl:if>
									<xsl:if test ="n1:Invoice/cbc:Note[contains(.,'##internetSatis_odemeSekli')]">
									<span>Bu satış İnternet üzerinden yapılmıştır.</span>
									</xsl:if>
								</div>
								<xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cbc:TaxExemptionReasonCode,'8') and (string-length(./cac:TaxCategory/cbc:TaxExemptionReasonCode) =3)]">
										<span style="font-weight:bold; ">Özel Matrah Kodu: </span>
										<xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/> - <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
										<br/>
										<span style="font-weight:bold; ">Özel Matrah Detayı: </span>
											<xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
											(<xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>)
											<xsl:text> Oran: %</xsl:text>
											<xsl:value-of select="cbc:Percent"/>
										
											Vergi Tutarı: 
											<xsl:value-of
												select="format-number(cbc:TaxAmount, '###.##0,00', 'european')"/>
												<xsl:text> </xsl:text>
												<xsl:if test="cbc:TaxAmount/@currencyID = 'TRY' or cbc:TaxAmount/@currencyID = 'TRL'">
													<xsl:text>TL</xsl:text>
												</xsl:if>
												<xsl:if test="cbc:TaxAmount/@currencyID != 'TRY' and cbc:TaxAmount/@currencyID != 'TRL'">
													<xsl:value-of select="cbc:TaxAmount/@currencyID"/>
												</xsl:if>
												Vergi Matrahı:
											<xsl:value-of
												select="format-number(cbc:TaxableAmount, '###.##0,00', 'european')"/>
												<xsl:text> </xsl:text>
												<xsl:if test="cbc:TaxableAmount/@currencyID = 'TRY' or cbc:TaxableAmount/@currencyID = 'TRL'">
													<xsl:text>TL</xsl:text>
												</xsl:if>
												<xsl:if test="cbc:TaxableAmount/@currencyID != 'TRY' and cbc:TaxableAmount/@currencyID != 'TRL'">
													<xsl:value-of select="cbc:TaxableAmount/@currencyID"/>
												</xsl:if>
										<br/>
								</xsl:for-each>

								<xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4') or starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6') or (starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'8'))]">
									<br/><span style="display:inline-block;font-weight:bold;  vertical-align: top;padding-right: 4px;">TEVKİFAT DETAYI: </span>
									<span style="display:inline-block;">
										<xsl:for-each select="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4') or starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6') or (starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'8'))]">
											<xsl:value-of select="./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/> - <xsl:value-of select="./cac:TaxCategory/cac:TaxScheme/cbc:Name"/> <br/>
										</xsl:for-each>
									</span>
									<div style="clear:both"></div>
								</xsl:if>

								<xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference and //n1:Invoice/cac:AdditionalDocumentReference/cbc:DocumentType!='XSLT'">
									<xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
									<xsl:if test="./cbc:DocumentType!='XSLT' and not(./cbc:DocumentTypeCode)">
									<br/><span style="font-weight:bold;">İLAVE DÖKÜMANLAR</span><br/>
									<xsl:if test="./cbc:ID">
										<span style="font-weight:bold;"> Belge No: </span>
										<xsl:value-of
                                                select="./cbc:ID"/>
									</xsl:if>
									<xsl:if test="./cbc:IssueDate">
										<span style="font-weight:bold;"> Belge Tarihi: </span>
										<xsl:value-of select="substring(./cbc:IssueDate,9,2)"
												/>-<xsl:value-of select="substring(./cbc:IssueDate,6,2)"
												/>-<xsl:value-of select="substring(./cbc:IssueDate,1,4)"/>
										
									</xsl:if>
									<xsl:if test="./cbc:DocumentType">
										<span style="font-weight:bold;"> Belge Tipi: </span>
										<xsl:value-of
                                                select="./cbc:DocumentType"/>
									</xsl:if>

									<xsl:if test="./cac:Attachment">
										<span style="font-weight:bold;"> Belge Adı: </span>
										<xsl:if test="./cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
										<xsl:value-of
                                                select="./cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@filename"/>
                                         </xsl:if>
									</xsl:if>

									<br/>
									</xsl:if>
								</xsl:for-each>
								</xsl:if>

								
								<xsl:if test="//n1:Invoice/cac:PaymentMeans">
								<br/><span style="font-weight:bold;">ÖDEME ŞEKLİ</span><br/>
								
								
								<xsl:for-each select="//n1:Invoice/cac:PaymentMeans">
									<xsl:if test="./cbc:PaymentMeansCode">
										<span style="font-weight:bold;">Ödeme Şekli: </span>
										

								<xsl:choose>
								<xsl:when test="./cbc:PaymentMeansCode  = 'ZZZ'">
									<span>
										<xsl:text>Diğer</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:PaymentMeansCode  = '20'">
									<span>
										<xsl:text>Çek</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:PaymentMeansCode  = '42'">
									<span>
										<xsl:text>Havale</xsl:text>
									</span>
								</xsl:when>
								
								<xsl:when test="./cbc:PaymentMeansCode  = '6'">
									<span>
										<xsl:text>Kredi</xsl:text>
									</span>
								</xsl:when>
								
								<xsl:when test="./cbc:PaymentMeansCode  = '48'">
									<span>
										<xsl:text>Kredi Kartı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:PaymentMeansCode  = '10'">
									<span>
										<xsl:text>Nakit</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:PaymentMeansCode  = '49'">
									<span>
										<xsl:text>Otomatik Ödeme</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:PaymentMeansCode  = '60'">
									<span>
										<xsl:text>Senet</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:PaymentMeansCode  = '1'">
									<span>
										<xsl:text>Sözleşme Kapsamında</xsl:text>
									</span>
								</xsl:when>

								</xsl:choose>

								</xsl:if>

								&#160;&#160;&#160;

								<xsl:if test="cbc:PaymentDueDate">
										<span style="font-weight:bold;">Son Ödeme Tarihi: </span>
										<xsl:value-of select="substring(cbc:PaymentDueDate,9,2)"
												/>-<xsl:value-of select="substring(cbc:PaymentDueDate,6,2)"
												/>-<xsl:value-of select="substring(cbc:PaymentDueDate,1,4)"/>&#160;&#160;&#160;
										
									</xsl:if>
									<xsl:if test="cbc:PaymentChannelCode">
										<span style="font-weight:bold;">Ödeme Kanalı: </span>
										<xsl:value-of
                                                select="cbc:PaymentChannelCode"/>&#160;&#160;&#160;
									</xsl:if>

									<xsl:if test="cac:PayeeFinancialAccount/cbc:ID">
											<span style="font-weight:bold;"> IBAN / Hesap No: </span>
											<xsl:value-of select="cac:PayeeFinancialAccount/cbc:ID"/>
											(<xsl:if test="cac:PayeeFinancialAccount/cbc:CurrencyCode = 'TRY' or cac:PayeeFinancialAccount/cbc:CurrencyCode = 'TRL'"><xsl:text>TL</xsl:text></xsl:if><xsl:if test="cac:PayeeFinancialAccount/cbc:CurrencyCode != 'TRY' and cac:PayeeFinancialAccount/cbc:CurrencyCode != 'TRL'"><xsl:value-of select="cac:PayeeFinancialAccount/cbc:CurrencyCode"/></xsl:if>)
									</xsl:if>

									<xsl:if test="cbc:InstructionNote">
										<br/><span style="font-weight:bold;">Ödeme Şekli Açıklaması:</span>
										<xsl:value-of
                                                select="cbc:InstructionNote"/>&#160;&#160;&#160;
									</xsl:if>


									<br/>

								</xsl:for-each>

								</xsl:if>

								
								<xsl:if test="//n1:Invoice/cac:InvoicePeriod">
								<br/><span style="font-weight:bold;">FATURA DÖNEM BİLGİLERİ</span><br/>
								
								
								<xsl:for-each select="//n1:Invoice/cac:InvoicePeriod">
									<xsl:if test="./cbc:StartDate">
										<span style="font-weight:bold;">Başlangıç Tarihi:</span>&#160;
										<xsl:value-of select="substring(./cbc:StartDate,9,2)"
												/>-<xsl:value-of select="substring(./cbc:StartDate,6,2)"
												/>-<xsl:value-of select="substring(./cbc:StartDate,1,4)"/>&#160;&#160;&#160;
										
										
									</xsl:if>
									<xsl:if test="./cbc:EndDate">
										<span style="font-weight:bold;">Bitiş Tarihi:</span>&#160;
										<xsl:value-of select="substring(./cbc:EndDate,9,2)"
												/>-<xsl:value-of select="substring(./cbc:EndDate,6,2)"
												/>-<xsl:value-of select="substring(./cbc:EndDate,1,4)"/>&#160;&#160;&#160;
										
									</xsl:if>

									<xsl:if test="./cbc:DurationMeasure">
										<span style="font-weight:bold;">Dönem Periyodu / Süresi: </span>
										<xsl:value-of
                                                select="./cbc:DurationMeasure"/>&#160;
										<xsl:choose>
								<xsl:when test="./cbc:DurationMeasure/@unitCode  = 'MON'">
									<span>
										<xsl:text>Ay</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:DurationMeasure/@unitCode  = 'DAY'">
									<span>
										<xsl:text>Gün</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="./cbc:DurationMeasure/@unitCode  = 'HUR'">
									<span>
										<xsl:text>Saat</xsl:text>
									</span>
								</xsl:when>
								
								<xsl:when test="./cbc:DurationMeasure/@unitCode  = 'ANN'">
									<span>
										<xsl:text>Yıl</xsl:text>
									</span>
								</xsl:when>

								</xsl:choose>

								&#160;

								</xsl:if>

								<br/>

								<xsl:if test="./cbc:Description">
									<span style="font-weight:bold;">Fatura Dönem Açıklaması:</span>&#160;
									<xsl:value-of select="./cbc:Description"/>&#160;&#160;&#160;
								</xsl:if>	

								</xsl:for-each>
								<br/>
								</xsl:if>
								<xsl:if test="//n1:Invoice/cac:ReceiptDocumentReference">
									<br/><span style="font-weight:bold;">ALINDI BİLGİLERİ</span><br/>
									<xsl:for-each select="//n1:Invoice/cac:ReceiptDocumentReference">
										<xsl:if test="./cbc:ID">
											<span style="font-weight:bold;">Belge Numarası: </span>
											<xsl:value-of select="./cbc:ID"/>
										</xsl:if>
										<xsl:if test="./cbc:IssueDate">
											<span style="font-weight:bold;"> Belge Tarihi: </span>
											<xsl:value-of select="substring(./cbc:IssueDate,9,2)"
												/>-<xsl:value-of select="substring(./cbc:IssueDate,6,2)"
												/>-<xsl:value-of select="substring(./cbc:IssueDate,1,4)"/>
										</xsl:if>
										<xsl:if test="./cbc:DocumentType">
											<span style="font-weight:bold;"> Belge Tipi: </span>
											<xsl:value-of select="./cbc:DocumentType"/>
										</xsl:if>
										<br/>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="//n1:Invoice/cac:PaymentTerms/cbc:PenaltySurchargePercen or //n1:Invoice/cac:PaymentTerms/cbc:Amount or //n1:Invoice/cac:PaymentTerms/cbc:Note">
									<br/><span style="font-weight:bold;">ÖDEME KOŞULLARI</span><br/>
								
								<xsl:for-each select="//n1:Invoice/cac:PaymentTerms">
									<xsl:if test="./cbc:PenaltySurchargePercent">
										<span style="font-weight:bold;">Gecikme Ceza Oranı: </span>
										<xsl:text> %</xsl:text>
									<xsl:value-of
									select="format-number(./cbc:PenaltySurchargePercent, '###.##0,00', 'european')"/>&#160;&#160;&#160;
									</xsl:if>
									<xsl:if test="./cbc:Amount">
										<span style="font-weight:bold;">Gecikme Ceza Tutarı:</span>&#160;
										<xsl:value-of select="format-number(./cbc:Amount, '###.##0,00', 'european')"/>
									</xsl:if>

									<xsl:if test="./cbc:Amount/@currencyID">
										<xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
											<xsl:text> TL</xsl:text>&#160;&#160;&#160;
										</xsl:if>
										<xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
											<xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID"/>&#160;&#160;&#160;
										</xsl:if>
									</xsl:if>


									<xsl:if test="./cbc:Note">
										<span style="font-weight:bold;">Açıklama: </span>
										<xsl:value-of
                                                select="./cbc:Note"/>
									</xsl:if>

									<br/>

								</xsl:for-each>
								<br/>
								</xsl:if>

					
                    <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
						<xsl:if test="cbc:Percent=0 and cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;0015&apos; and not(cac:TaxCategory/cbc:TaxExemptionReasonCode > 0)">  
							<b>Vergi İstisna Muafiyet Sebebi: </b>
							<xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
							<br/>
						</xsl:if>
                    </xsl:for-each>

					
	                <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[not(./cac:TaxCategory/cbc:TaxExemptionReasonCode=preceding::*)]">
	                    	<xsl:if test="cac:TaxCategory/cbc:TaxExemptionReasonCode > 0 and not(starts-with(./cac:TaxCategory/cbc:TaxExemptionReasonCode,'8') and (string-length(./cac:TaxCategory/cbc:TaxExemptionReasonCode) =3))">
	                        <b>Vergi İstisna Muafiyet Sebebi: </b>
							<xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/> - <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/> - <xsl:value-of select="cac:TaxCategory/cbc:Name"/>
	                        <br/>
	                    </xsl:if>
	                </xsl:for-each>
					
							</td>
						</tr>
					</tbody>
				</table>
			</div> 

				</div> 
			</div>
	</body>

	</html>

	</xsl:template>
	
			<xsl:template match="//n1:Invoice/cac:InvoiceLine"> 
				<tr>
							<td>
				<span>
					<xsl:value-of select="format-number(./cbc:ID, '#')"/>
				</span>
			</td>
			<td class="wrap">
				<span>
					<xsl:value-of select="./cac:Item/cbc:Name"/>
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="./cac:Item/cbc:BrandName"/>
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="./cac:Item/cbc:ModelName"/>
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="./cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode"/>
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="./cac:Item/cac:ItemInstance/cbc:SerialID"/>
				</span>
			</td>
			<td>
				<span>
					<xsl:value-of
						select="format-number(./cbc:InvoicedQuantity, '#.###.###,########', 'european')"/>
					<xsl:if test="./cbc:InvoicedQuantity/@unitCode">
						<xsl:for-each select="./cbc:InvoicedQuantity">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="@unitCode  = '26'">
									<span>
										<xsl:text>Ton</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'SET'">
									<span>
										<xsl:text>Set</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'BX'">
									<span>
										<xsl:text>Kutu</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'LTR'">
									<span>
										<xsl:text>LT</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'HUR'">
									<span>
										<xsl:text>Saat</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'NIU' or @unitCode  = 'C62'">
									<span>
										<xsl:text>Adet</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KGM'">
									<span>
										<xsl:text>KG</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KJO'">
									<span>
										<xsl:text>kJ</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'GRM'">
									<span>
										<xsl:text>G</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MGM'">
									<span>
										<xsl:text>MG</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'NT'">
									<span>
										<xsl:text>Net Ton</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'GT'">
									<span>
										<xsl:text>GT</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MTR'">
									<span>
										<xsl:text>M</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MMT'">
									<span>
										<xsl:text>MM</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KTM'">
									<span>
										<xsl:text>KM</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MLT'">
									<span>
										<xsl:text>ML</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MMQ'">
									<span>
										<xsl:text>MM3</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'CLT'">
									<span>
										<xsl:text>CL</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'CMK'">
									<span>
										<xsl:text>CM2</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'CMQ'">
									<span>
										<xsl:text>CM3</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'CMT'">
									<span>
										<xsl:text>CM</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'DMT'">
									<span>
										<xsl:text>DM</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MTK'">
									<span>
										<xsl:text>M2</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MTQ'">
									<span>
										<xsl:text>M3</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'DAY'">
									<span>
										<xsl:text> Gün</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MON'">
									<span>
										<xsl:text> Ay</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'PA'">
									<span>
										<xsl:text> Paket</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KWH'">
									<span>
										<xsl:text> KWH</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'D61'">
									<span>
										<xsl:text> Dakika</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'D62'">
									<span>
										<xsl:text> Saniye</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'ANN'">
									<span>
										<xsl:text> Yıl</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'AFF'">
									<span>
										<xsl:text> AFİF</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'AYR'">
									<span>
										<xsl:text> Altın Ayarı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'B32'">
									<span>
										<xsl:text> KG/Metre Kare</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'CCT'">
									<span>
										<xsl:text> Ton Başına Taşıma Kapasitesi</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'CPR'">
									<span>
										<xsl:text> Adet-Çift</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'D30'">
									<span>
										<xsl:text> Brüt Kalori Değeri</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'D40'">
									<span>
										<xsl:text> Bin Litre</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'GFI'">
									<span>
										<xsl:text> FISSILE İzotop Gramı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'GMS'">
									<span>
										<xsl:text> Gümüş</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'GRM'">
									<span>
										<xsl:text> Gram</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'H62'">
									<span>
										<xsl:text> Yüz Adet</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'K20'">
									<span>
										<xsl:text> Kilogram Potasyum Oksit</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'K58'">
									<span>
										<xsl:text> Kurutulmuş Net Ağırlıklı Kg.</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'K62'">
									<span>
										<xsl:text> Kilogram-Adet</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KFO'">
									<span>
										<xsl:text> Difosfor Pentaoksit Kilogramı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KGM'">
									<span>
										<xsl:text> Kilogram</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KH6'">
									<span>
										<xsl:text> Kilogram-Baş</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KHO'">
									<span>
										<xsl:text> Hidrojen Peroksit Kilogramı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KMA'">
									<span>
										<xsl:text> Metil Aminlerin Kilogramı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KNI'">
									<span>
										<xsl:text> Azotun Kilogramı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KOH'">
									<span>
										<xsl:text> Kg. Potasyum Hidroksit</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KPH'">
									<span>
										<xsl:text> Kg Potasyum Oksid</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KPR'">
									<span>
										<xsl:text> Kilogram-Çift</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KSD'">
									<span>
										<xsl:text> %90 Kuru Ürün Kg.</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KSH'">
									<span>
										<xsl:text> Sodyum Hidroksit Kg.</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KUR'">
									<span>
										<xsl:text> Uranyum Kilogramı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KWH'">
									<span>
										<xsl:text> Kilowatt Saat</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'KWT'">
									<span>
										<xsl:text> Kilowatt</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'LPA'">
									<span>
										<xsl:text> Saf Alkol Litresi</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'LTR'">
									<span>
										<xsl:text> Litre</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'MTR'">
									<span>
										<xsl:text> Metre</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'NCL'">
									<span>
										<xsl:text> Hücre Adedi</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'NCR'">
									<span>
										<xsl:text> Karat</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'OMV'">
									<span>
										<xsl:text> OTV Maktu Vergi</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'OTB'">
									<span>
										<xsl:text> OTV birim fiyatı</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'PR'">
									<span>
										<xsl:text> Çift</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'R9'">
									<span>
										<xsl:text> Bin Metre Küp</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'T3'">
									<span>
										<xsl:text> Bin Adet</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode  = 'TWH'">
									<span>
										<xsl:text> Bin Kilowatt Saat</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'GRO'">
									<span>
										<xsl:text> Grosa</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'DZN'">
									<span>
										<xsl:text> Düzine</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'MWH'">
									<span>
										<xsl:text> MEGAWATT SAAT (1000 kW.h)</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'YRD'">
									<span>
										<xsl:text> Yard</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'DMK'">
									<span>
										<xsl:text> Desimetrekare</xsl:text>
									</span>
								</xsl:when>
                                <xsl:when test="@unitCode = 'FOT'">
									<span>
										<xsl:text> Ayak</xsl:text>
									</span>
								</xsl:when>
                                <xsl:when test="@unitCode = 'DAA'">
									<span>
										<xsl:text> Dekar</xsl:text>
									</span>
								</xsl:when>
                                <xsl:when test="@unitCode = 'TY'">
									<span>
										<xsl:text> Tüp</xsl:text>
									</span>
								</xsl:when>
                                <xsl:when test="@unitCode = 'BO'">
									<span>
										<xsl:text> Şişe</xsl:text>
									</span>
								</xsl:when>
                                <xsl:when test="@unitCode = 'BG'">
									<span>
										<xsl:text> Çanta</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'TK'">
									<span>
										<xsl:text> Takım</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'LM'">
									<span>
										<xsl:text> Metre Tül</xsl:text>
									</span>
								</xsl:when>
								<xsl:when test="@unitCode = 'ST'">
									<span>
										<xsl:text> Tabaka</xsl:text>
									</span>
								</xsl:when>
								<xsl:otherwise>
									<span>
										<xsl:value-of select="@unitCode"/>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:if>
				</span>
			</td>
			<td>
				<span>
					<xsl:value-of
						select="format-number(./cac:Price/cbc:PriceAmount, '###.##0,########', 'european')"/>
					<xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID">
						<xsl:text> </xsl:text>
						<xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
							<xsl:text>TL</xsl:text>
						</xsl:if>
						<xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
							<xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID"/>
						</xsl:if>
					</xsl:if>
				</span>
			</td>
			<td>
				<span>
					<xsl:text>&#160;</xsl:text>
					<xsl:value-of
						select="format-number(./cbc:LineExtensionAmount, '###.##0,00', 'european')"/>
					<xsl:if test="./cbc:LineExtensionAmount/@currencyID">
						<xsl:text> </xsl:text>
						<xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
							<xsl:text>TL</xsl:text>
						</xsl:if>
						<xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
							<xsl:value-of select="./cbc:LineExtensionAmount/@currencyID"/>
						</xsl:if>
					</xsl:if>
				</span>
			</td>
<xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
			<td>
				<span>
					<xsl:for-each
						select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
						<xsl:if test="cbc:TaxTypeCode='0015' ">
							<xsl:text> </xsl:text>
							<xsl:if test="../../cbc:Percent">
								<xsl:text> %</xsl:text>
								<xsl:value-of
									select="format-number(../../cbc:Percent, '###.##0,00', 'european')"
								/>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
				</span>
			</td>
</xsl:if> 

				</tr>
			</xsl:template>

	</xsl:stylesheet>
