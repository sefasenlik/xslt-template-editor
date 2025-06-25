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
        <xsl:if test="not(contains(substring(substring-before(concat($pText,'&#xA;'),'&#xA;'),0,8), '##')) and string-length(substring-before(concat($pText,'&#xA;'),'&#xA;'))>3">
            <b>* </b>
            <xsl:copy-of select="substring-before(concat($pText,'&#xA;'),'&#xA;')"/>
            <br />
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
        <xsl:if test="contains(substring(substring-before(concat($pText,'&#xA;'),'&#xA;'),0,8), '##')">
            <tr>
                <th>
                    <xsl:copy-of select="substring-after(substring-before(substring-before(concat($pText,'&#xA;'),'&#xA;'),':'),'##')"/>
                    :
                </th>
                <td>
                    <xsl:copy-of select="substring-after(substring-before(concat($pText,'&#xA;'),'&#xA;'),':')"/>
                </td>
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
    <xsl:template name="TransportMode">
        <xsl:param name="TransportModeType" />
        <xsl:choose>
            <xsl:when test="$TransportModeType=1">Denizyolu</xsl:when>
            <xsl:when test="$TransportModeType=2">Demiryolu</xsl:when>
            <xsl:when test="$TransportModeType=3">Karayolu</xsl:when>
            <xsl:when test="$TransportModeType=4">Havayolu</xsl:when>
            <xsl:when test="$TransportModeType=5">Posta</xsl:when>
            <xsl:when test="$TransportModeType=6">Çok araçlı</xsl:when>
            <xsl:when test="$TransportModeType=7">Sabit taşıma tesisleri</xsl:when>
            <xsl:when test="$TransportModeType=8">İç su taşımacılığı</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$TransportModeType"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="Packaging">
        <xsl:param name="PackagingType" />
        <xsl:choose>
            <xsl:when test="$PackagingType='1A'">Drum, steel</xsl:when>
            <xsl:when test="$PackagingType='1B'">Drum, aluminium</xsl:when>
            <xsl:when test="$PackagingType='1D'">Drum, plywood</xsl:when>
            <xsl:when test="$PackagingType='1F'">Container, flexible</xsl:when>
            <xsl:when test="$PackagingType='1G'">Drum, fibre</xsl:when>
            <xsl:when test="$PackagingType='1W'">Drum, wooden</xsl:when>
            <xsl:when test="$PackagingType='2C'">Barrel, wooden</xsl:when>
            <xsl:when test="$PackagingType='3A'">Jerrican, steel</xsl:when>
            <xsl:when test="$PackagingType='3H'">Jerrican, plastic</xsl:when>
            <xsl:when test="$PackagingType='43'">Bag, super bulk</xsl:when>
            <xsl:when test="$PackagingType='44'">Bag, polybag</xsl:when>
            <xsl:when test="$PackagingType='4A'">Box, steel</xsl:when>
            <xsl:when test="$PackagingType='4B'">Box, aluminium</xsl:when>
            <xsl:when test="$PackagingType='4C'">Box, natural wood</xsl:when>
            <xsl:when test="$PackagingType='4D'">Box, plywood</xsl:when>
            <xsl:when test="$PackagingType='4F'">Box, reconstituted wood</xsl:when>
            <xsl:when test="$PackagingType='4G'">Box, fibreboard</xsl:when>
            <xsl:when test="$PackagingType='4H'">Box, plastic</xsl:when>
            <xsl:when test="$PackagingType='5H'">Bag, woven plastic</xsl:when>
            <xsl:when test="$PackagingType='5L'">Bag, textile</xsl:when>
            <xsl:when test="$PackagingType='5M'">Bag, paper</xsl:when>
            <xsl:when test="$PackagingType='6H'">Composite packaging, plastic receptacle</xsl:when>
            <xsl:when test="$PackagingType='6P'">Composite packaging, glass receptacle</xsl:when>
            <xsl:when test="$PackagingType='7A'">Case, car</xsl:when>
            <xsl:when test="$PackagingType='7B'">Case, wooden</xsl:when>
            <xsl:when test="$PackagingType='8A'">Pallet, wooden</xsl:when>
            <xsl:when test="$PackagingType='8B'">Crate, wooden</xsl:when>
            <xsl:when test="$PackagingType='8C'">Bundle, wooden</xsl:when>
            <xsl:when test="$PackagingType='AA'">Intermediate bulk container, rigid plastic</xsl:when>
            <xsl:when test="$PackagingType='AB'">Receptacle, fibre</xsl:when>
            <xsl:when test="$PackagingType='AC'">Receptacle, paper</xsl:when>
            <xsl:when test="$PackagingType='AD'">Receptacle, wooden</xsl:when>
            <xsl:when test="$PackagingType='AE'">Aerosol</xsl:when>
            <xsl:when test="$PackagingType='AF'">Pallet, modular, collars 80cms * 60cms</xsl:when>
            <xsl:when test="$PackagingType='AG'">Pallet, shrinkwrapped</xsl:when>
            <xsl:when test="$PackagingType='AH'">Pallet, 100cms * 110cms</xsl:when>
            <xsl:when test="$PackagingType='AI'">Clamshell</xsl:when>
            <xsl:when test="$PackagingType='AJ'">Cone</xsl:when>
            <xsl:when test="$PackagingType='AL'">Ball</xsl:when>
            <xsl:when test="$PackagingType='AM'">Ampoule, non-protected</xsl:when>
            <xsl:when test="$PackagingType='AP'">Ampoule, protected</xsl:when>
            <xsl:when test="$PackagingType='AT'">Atomizer</xsl:when>
            <xsl:when test="$PackagingType='AV'">Capsule</xsl:when>
            <xsl:when test="$PackagingType='B4'">Belt</xsl:when>
            <xsl:when test="$PackagingType='BA'">Barrel</xsl:when>
            <xsl:when test="$PackagingType='BB'">Bobbin</xsl:when>
            <xsl:when test="$PackagingType='BC'">Bottlecrate / bottlerack</xsl:when>
            <xsl:when test="$PackagingType='BD'">Board</xsl:when>
            <xsl:when test="$PackagingType='BE'">Bundle</xsl:when>
            <xsl:when test="$PackagingType='BF'">Balloon, non-protected</xsl:when>
            <xsl:when test="$PackagingType='BG'">Bag</xsl:when>
            <xsl:when test="$PackagingType='BH'">Bunch</xsl:when>
            <xsl:when test="$PackagingType='BI'">Bin</xsl:when>
            <xsl:when test="$PackagingType='BJ'">Bucket</xsl:when>
            <xsl:when test="$PackagingType='BK'">Basket</xsl:when>
            <xsl:when test="$PackagingType='BL'">Bale, compressed</xsl:when>
            <xsl:when test="$PackagingType='BM'">Basin</xsl:when>
            <xsl:when test="$PackagingType='BN'">Bale, non-compressed</xsl:when>
            <xsl:when test="$PackagingType='BO'">Bottle, non-protected, cylindrical</xsl:when>
            <xsl:when test="$PackagingType='BP'">Balloon, protected</xsl:when>
            <xsl:when test="$PackagingType='BQ'">Bottle, protected cylindrical</xsl:when>
            <xsl:when test="$PackagingType='BR'">Bar</xsl:when>
            <xsl:when test="$PackagingType='BS'">Bottle, non-protected, bulbous</xsl:when>
            <xsl:when test="$PackagingType='BT'">Bolt</xsl:when>
            <xsl:when test="$PackagingType='BU'">Butt</xsl:when>
            <xsl:when test="$PackagingType='BV'">Bottle, protected bulbous</xsl:when>
            <xsl:when test="$PackagingType='BW'">Box, for liquids</xsl:when>
            <xsl:when test="$PackagingType='BX'">Box</xsl:when>
            <xsl:when test="$PackagingType='BY'">Board, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='BZ'">Bars, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='CA'">Can, rectangular</xsl:when>
            <xsl:when test="$PackagingType='CB'">Crate, beer</xsl:when>
            <xsl:when test="$PackagingType='CC'">Churn</xsl:when>
            <xsl:when test="$PackagingType='CD'">Can, with handle and spout</xsl:when>
            <xsl:when test="$PackagingType='CE'">Creel</xsl:when>
            <xsl:when test="$PackagingType='CF'">Coffer</xsl:when>
            <xsl:when test="$PackagingType='CG'">Cage</xsl:when>
            <xsl:when test="$PackagingType='CH'">Chest</xsl:when>
            <xsl:when test="$PackagingType='CI'">Canister</xsl:when>
            <xsl:when test="$PackagingType='CJ'">Coffin</xsl:when>
            <xsl:when test="$PackagingType='CK'">Cask</xsl:when>
            <xsl:when test="$PackagingType='CL'">Coil</xsl:when>
            <xsl:when test="$PackagingType='CM'">Card</xsl:when>
            <xsl:when test="$PackagingType='CN'">Container, not otherwise specified as transport equipment</xsl:when>
            <xsl:when test="$PackagingType='CO'">Carboy, non-protected</xsl:when>
            <xsl:when test="$PackagingType='CP'">Carboy, protected</xsl:when>
            <xsl:when test="$PackagingType='CQ'">Cartridge</xsl:when>
            <xsl:when test="$PackagingType='CR'">Crate</xsl:when>
            <xsl:when test="$PackagingType='CS'">Case</xsl:when>
            <xsl:when test="$PackagingType='CT'">Carton</xsl:when>
            <xsl:when test="$PackagingType='CU'">Cup</xsl:when>
            <xsl:when test="$PackagingType='CV'">Cover</xsl:when>
            <xsl:when test="$PackagingType='CW'">Cage, roll</xsl:when>
            <xsl:when test="$PackagingType='CX'">Can, cylindrical</xsl:when>
            <xsl:when test="$PackagingType='CY'">Cylinder</xsl:when>
            <xsl:when test="$PackagingType='CZ'">Canvas</xsl:when>
            <xsl:when test="$PackagingType='DA'">Crate, multiple layer, plastic</xsl:when>
            <xsl:when test="$PackagingType='DB'">Crate, multiple layer, wooden</xsl:when>
            <xsl:when test="$PackagingType='DC'">Crate, multiple layer, cardboard</xsl:when>
            <xsl:when test="$PackagingType='DG'">Cage, Commonwealth Handling Equipment Pool (CHEP)</xsl:when>
            <xsl:when test="$PackagingType='DH'">Box, Commonwealth Handling Equipment Pool (CHEP), Eurobox</xsl:when>
            <xsl:when test="$PackagingType='DI'">Drum, iron</xsl:when>
            <xsl:when test="$PackagingType='DJ'">Demijohn, non-protected</xsl:when>
            <xsl:when test="$PackagingType='DK'">Crate, bulk, cardboard</xsl:when>
            <xsl:when test="$PackagingType='DL'">Crate, bulk, plastic</xsl:when>
            <xsl:when test="$PackagingType='DM'">Crate, bulk, wooden</xsl:when>
            <xsl:when test="$PackagingType='DN'">Dispenser</xsl:when>
            <xsl:when test="$PackagingType='DP'">Demijohn, protected</xsl:when>
            <xsl:when test="$PackagingType='DR'">Drum</xsl:when>
            <xsl:when test="$PackagingType='DS'">Tray, one layer no cover, plastic</xsl:when>
            <xsl:when test="$PackagingType='DT'">Tray, one layer no cover, wooden</xsl:when>
            <xsl:when test="$PackagingType='DU'">Tray, one layer no cover, polystyrene</xsl:when>
            <xsl:when test="$PackagingType='DV'">Tray, one layer no cover, cardboard</xsl:when>
            <xsl:when test="$PackagingType='DW'">Tray, two layers no cover, plastic tray</xsl:when>
            <xsl:when test="$PackagingType='DX'">Tray, two layers no cover, wooden</xsl:when>
            <xsl:when test="$PackagingType='DY'">Tray, two layers no cover, cardboard</xsl:when>
            <xsl:when test="$PackagingType='EC'">Bag, plastic</xsl:when>
            <xsl:when test="$PackagingType='ED'">Case, with pallet base</xsl:when>
            <xsl:when test="$PackagingType='EE'">Case, with pallet base, wooden</xsl:when>
            <xsl:when test="$PackagingType='EF'">Case, with pallet base, cardboard</xsl:when>
            <xsl:when test="$PackagingType='EG'">Case, with pallet base, plastic</xsl:when>
            <xsl:when test="$PackagingType='EH'">Case, with pallet base, metal</xsl:when>
            <xsl:when test="$PackagingType='EI'">Case, isothermic</xsl:when>
            <xsl:when test="$PackagingType='EN'">Envelope</xsl:when>
            <xsl:when test="$PackagingType='FB'">Flexibag</xsl:when>
            <xsl:when test="$PackagingType='FC'">Crate, fruit</xsl:when>
            <xsl:when test="$PackagingType='FD'">Crate, framed</xsl:when>
            <xsl:when test="$PackagingType='FE'">Flexitank</xsl:when>
            <xsl:when test="$PackagingType='FI'">Firkin</xsl:when>
            <xsl:when test="$PackagingType='FL'">Flask</xsl:when>
            <xsl:when test="$PackagingType='FO'">Footlocker</xsl:when>
            <xsl:when test="$PackagingType='FP'">Filmpack</xsl:when>
            <xsl:when test="$PackagingType='FR'">Frame</xsl:when>
            <xsl:when test="$PackagingType='FT'">Foodtainer</xsl:when>
            <xsl:when test="$PackagingType='FW'">Cart, flatbed</xsl:when>
            <xsl:when test="$PackagingType='FX'">Bag, flexible container</xsl:when>
            <xsl:when test="$PackagingType='GB'">Bottle, gas</xsl:when>
            <xsl:when test="$PackagingType='GI'">Girder</xsl:when>
            <xsl:when test="$PackagingType='GL'">Container, gallon</xsl:when>
            <xsl:when test="$PackagingType='GR'">Receptacle, glass</xsl:when>
            <xsl:when test="$PackagingType='GU'">Tray, containing horizontally stacked flat items</xsl:when>
            <xsl:when test="$PackagingType='GY'">Bag, gunny</xsl:when>
            <xsl:when test="$PackagingType='GZ'">Girders, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='HA'">Basket, with handle, plastic</xsl:when>
            <xsl:when test="$PackagingType='HB'">Basket, with handle, wooden</xsl:when>
            <xsl:when test="$PackagingType='HC'">Basket, with handle, cardboard</xsl:when>
            <xsl:when test="$PackagingType='HG'">Hogshead</xsl:when>
            <xsl:when test="$PackagingType='HN'">Hanger</xsl:when>
            <xsl:when test="$PackagingType='HR'">Hamper</xsl:when>
            <xsl:when test="$PackagingType='IA'">Package, display, wooden</xsl:when>
            <xsl:when test="$PackagingType='IB'">Package, display, cardboard</xsl:when>
            <xsl:when test="$PackagingType='IC'">Package, display, plastic</xsl:when>
            <xsl:when test="$PackagingType='ID'">Package, display, metal</xsl:when>
            <xsl:when test="$PackagingType='IE'">Package, show</xsl:when>
            <xsl:when test="$PackagingType='IF'">Package, flow</xsl:when>
            <xsl:when test="$PackagingType='IG'">Package, paper wrapped</xsl:when>
            <xsl:when test="$PackagingType='IH'">Drum, plastic</xsl:when>
            <xsl:when test="$PackagingType='IK'">Package, cardboard, with bottle grip-holes</xsl:when>
            <xsl:when test="$PackagingType='IL'">Tray, rigid, lidded stackable (CEN TS 14482:2002)</xsl:when>
            <xsl:when test="$PackagingType='IN'">Ingot</xsl:when>
            <xsl:when test="$PackagingType='IZ'">Ingots, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='JB'">Bag, jumbo</xsl:when>
            <xsl:when test="$PackagingType='JC'">Jerrican, rectangular</xsl:when>
            <xsl:when test="$PackagingType='JG'">Jug</xsl:when>
            <xsl:when test="$PackagingType='JR'">Jar</xsl:when>
            <xsl:when test="$PackagingType='JT'">Jutebag</xsl:when>
            <xsl:when test="$PackagingType='JY'">Jerrican, cylindrical</xsl:when>
            <xsl:when test="$PackagingType='KG'">Keg</xsl:when>
            <xsl:when test="$PackagingType='KI'">Kit</xsl:when>
            <xsl:when test="$PackagingType='LE'">Luggage</xsl:when>
            <xsl:when test="$PackagingType='LG'">Log</xsl:when>
            <xsl:when test="$PackagingType='LT'">Lot</xsl:when>
            <xsl:when test="$PackagingType='LU'">Lug</xsl:when>
            <xsl:when test="$PackagingType='LV'">Liftvan</xsl:when>
            <xsl:when test="$PackagingType='LZ'">Logs, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='MA'">Crate, metal</xsl:when>
            <xsl:when test="$PackagingType='MB'">Bag, multiply</xsl:when>
            <xsl:when test="$PackagingType='MC'">Crate, milk</xsl:when>
            <xsl:when test="$PackagingType='ME'">Container, metal</xsl:when>
            <xsl:when test="$PackagingType='MR'">Receptacle, metal</xsl:when>
            <xsl:when test="$PackagingType='MS'">Sack, multi-wall</xsl:when>
            <xsl:when test="$PackagingType='MT'">Mat</xsl:when>
            <xsl:when test="$PackagingType='MW'">Receptacle, plastic wrapped</xsl:when>
            <xsl:when test="$PackagingType='MX'">Matchbox</xsl:when>
            <xsl:when test="$PackagingType='NA'">Not available</xsl:when>
            <xsl:when test="$PackagingType='NE'">Unpacked or unpackaged</xsl:when>
            <xsl:when test="$PackagingType='NF'">Unpacked or unpackaged, single unit</xsl:when>
            <xsl:when test="$PackagingType='NG'">Unpacked or unpackaged, multiple units</xsl:when>
            <xsl:when test="$PackagingType='NS'">Nest</xsl:when>
            <xsl:when test="$PackagingType='NT'">Net</xsl:when>
            <xsl:when test="$PackagingType='NU'">Net, tube, plastic</xsl:when>
            <xsl:when test="$PackagingType='NV'">Net, tube, textile</xsl:when>
            <xsl:when test="$PackagingType='OA'">Pallet, CHEP 40 cm x 60 cm</xsl:when>
            <xsl:when test="$PackagingType='OB'">Pallet, CHEP 80 cm x 120 cm</xsl:when>
            <xsl:when test="$PackagingType='OC'">Pallet, CHEP 100 cm x 120 cm</xsl:when>
            <xsl:when test="$PackagingType='OD'">Pallet, AS 4068-1993</xsl:when>
            <xsl:when test="$PackagingType='OE'">Pallet, ISO T11</xsl:when>
            <xsl:when test="$PackagingType='OF'">Platform, unspecified weight or dimension</xsl:when>
            <xsl:when test="$PackagingType='OK'">Block</xsl:when>
            <xsl:when test="$PackagingType='OT'">Octabin</xsl:when>
            <xsl:when test="$PackagingType='OU'">Container, outer</xsl:when>
            <xsl:when test="$PackagingType='P2'">Pan</xsl:when>
            <xsl:when test="$PackagingType='PA'">Packet</xsl:when>
            <xsl:when test="$PackagingType='PB'">Pallet, box Combined open-ended box and pallet</xsl:when>
            <xsl:when test="$PackagingType='PC'">Parcel</xsl:when>
            <xsl:when test="$PackagingType='PD'">Pallet, modular, collars 80cms * 100cms</xsl:when>
            <xsl:when test="$PackagingType='PE'">Pallet, modular, collars 80cms * 120cms</xsl:when>
            <xsl:when test="$PackagingType='PF'">Pen</xsl:when>
            <xsl:when test="$PackagingType='PG'">Plate</xsl:when>
            <xsl:when test="$PackagingType='PH'">Pitcher</xsl:when>
            <xsl:when test="$PackagingType='PI'">Pipe</xsl:when>
            <xsl:when test="$PackagingType='PJ'">Punnet</xsl:when>
            <xsl:when test="$PackagingType='PK'">Package</xsl:when>
            <xsl:when test="$PackagingType='PL'">Pail</xsl:when>
            <xsl:when test="$PackagingType='PN'">Plank</xsl:when>
            <xsl:when test="$PackagingType='PO'">Pouch</xsl:when>
            <xsl:when test="$PackagingType='PP'">Piece</xsl:when>
            <xsl:when test="$PackagingType='PR'">Receptacle, plastic</xsl:when>
            <xsl:when test="$PackagingType='PT'">Pot</xsl:when>
            <xsl:when test="$PackagingType='PU'">Tray</xsl:when>
            <xsl:when test="$PackagingType='PV'">Pipes, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='PX'">Pallet</xsl:when>
            <xsl:when test="$PackagingType='PY'">Plates, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='PZ'">Planks, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='QA'">Drum, steel, non-removable head</xsl:when>
            <xsl:when test="$PackagingType='QB'">Drum, steel, removable head</xsl:when>
            <xsl:when test="$PackagingType='QC'">Drum, aluminium, non-removable head</xsl:when>
            <xsl:when test="$PackagingType='QD'">Drum, aluminium, removable head</xsl:when>
            <xsl:when test="$PackagingType='QF'">Drum, plastic, non-removable head</xsl:when>
            <xsl:when test="$PackagingType='QG'">Drum, plastic, removable head</xsl:when>
            <xsl:when test="$PackagingType='QH'">Barrel, wooden, bung type</xsl:when>
            <xsl:when test="$PackagingType='QJ'">Barrel, wooden, removable head</xsl:when>
            <xsl:when test="$PackagingType='QK'">Jerrican, steel, non-removable head</xsl:when>
            <xsl:when test="$PackagingType='QL'">Jerrican, steel, removable head</xsl:when>
            <xsl:when test="$PackagingType='QM'">Jerrican, plastic, non-removable head</xsl:when>
            <xsl:when test="$PackagingType='QN'">Jerrican, plastic, removable head</xsl:when>
            <xsl:when test="$PackagingType='QP'">Box, wooden, natural wood, ordinary</xsl:when>
            <xsl:when test="$PackagingType='QQ'">Box, wooden, natural wood, with sift proof walls</xsl:when>
            <xsl:when test="$PackagingType='QR'">Box, plastic, expanded</xsl:when>
            <xsl:when test="$PackagingType='QS'">Box, plastic, solid</xsl:when>
            <xsl:when test="$PackagingType='RD'">Rod</xsl:when>
            <xsl:when test="$PackagingType='RG'">Ring</xsl:when>
            <xsl:when test="$PackagingType='RJ'">Rack, clothing hanger</xsl:when>
            <xsl:when test="$PackagingType='RK'">Rack</xsl:when>
            <xsl:when test="$PackagingType='RL'">Reel</xsl:when>
            <xsl:when test="$PackagingType='RO'">Roll</xsl:when>
            <xsl:when test="$PackagingType='RT'">Rednet</xsl:when>
            <xsl:when test="$PackagingType='RZ'">Rods, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='SA'">Sack</xsl:when>
            <xsl:when test="$PackagingType='SB'">Slab</xsl:when>
            <xsl:when test="$PackagingType='SC'">Crate, shallow</xsl:when>
            <xsl:when test="$PackagingType='SD'">Spindle</xsl:when>
            <xsl:when test="$PackagingType='SE'">Sea-chest</xsl:when>
            <xsl:when test="$PackagingType='SH'">Sachet</xsl:when>
            <xsl:when test="$PackagingType='SI'">Skid</xsl:when>
            <xsl:when test="$PackagingType='SK'">Case, skeleton</xsl:when>
            <xsl:when test="$PackagingType='SL'">Slipsheet</xsl:when>
            <xsl:when test="$PackagingType='SM'">Sheetmetal</xsl:when>
            <xsl:when test="$PackagingType='SO'">Spool</xsl:when>
            <xsl:when test="$PackagingType='SP'">Sheet, plastic wrapping</xsl:when>
            <xsl:when test="$PackagingType='SS'">Case, steel</xsl:when>
            <xsl:when test="$PackagingType='ST'">Sheet</xsl:when>
            <xsl:when test="$PackagingType='SU'">Suitcase</xsl:when>
            <xsl:when test="$PackagingType='SV'">Envelope, steel</xsl:when>
            <xsl:when test="$PackagingType='SW'">Shrinkwrapped</xsl:when>
            <xsl:when test="$PackagingType='SX'">Set</xsl:when>
            <xsl:when test="$PackagingType='SY'">Sleeve</xsl:when>
            <xsl:when test="$PackagingType='SZ'">Sheets, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='T1'">Tablet</xsl:when>
            <xsl:when test="$PackagingType='TB'">Tub</xsl:when>
            <xsl:when test="$PackagingType='TC'">Tea-chest</xsl:when>
            <xsl:when test="$PackagingType='TD'">Tube, collapsible</xsl:when>
            <xsl:when test="$PackagingType='TE'">Tyre</xsl:when>
            <xsl:when test="$PackagingType='TG'">Tank container, generic</xsl:when>
            <xsl:when test="$PackagingType='TI'">Tierce</xsl:when>
            <xsl:when test="$PackagingType='TK'">Tank, rectangular</xsl:when>
            <xsl:when test="$PackagingType='TL'">Tub, with lid</xsl:when>
            <xsl:when test="$PackagingType='TN'">Tin</xsl:when>
            <xsl:when test="$PackagingType='TO'">Tun</xsl:when>
            <xsl:when test="$PackagingType='TR'">Trunk</xsl:when>
            <xsl:when test="$PackagingType='TS'">Truss</xsl:when>
            <xsl:when test="$PackagingType='TT'">Bag, tote</xsl:when>
            <xsl:when test="$PackagingType='TU'">Tube</xsl:when>
            <xsl:when test="$PackagingType='TV'">Tube, with nozzle</xsl:when>
            <xsl:when test="$PackagingType='TW'">Pallet, triwall</xsl:when>
            <xsl:when test="$PackagingType='TY'">Tank, cylindrical</xsl:when>
            <xsl:when test="$PackagingType='TZ'">Tubes, in bundle/bunch/truss</xsl:when>
            <xsl:when test="$PackagingType='UC'">Uncaged</xsl:when>
            <xsl:when test="$PackagingType='UN'">Unit</xsl:when>
            <xsl:when test="$PackagingType='VA'">Vat</xsl:when>
            <xsl:when test="$PackagingType='VG'">Bulk, gas (at 1031 mbar and 15Â°C)</xsl:when>
            <xsl:when test="$PackagingType='VI'">Vial</xsl:when>
            <xsl:when test="$PackagingType='VK'">Vanpack</xsl:when>
            <xsl:when test="$PackagingType='VL'">Bulk, liquid</xsl:when>
            <xsl:when test="$PackagingType='VO'">Bulk, solid, large particles (Â“nodulesÂ”)</xsl:when>
            <xsl:when test="$PackagingType='VP'">Vacuum-packed</xsl:when>
            <xsl:when test="$PackagingType='VQ'">Bulk, liquefied gas (at abnormal temperature/pressure)</xsl:when>
            <xsl:when test="$PackagingType='VN'">Vehicle</xsl:when>
            <xsl:when test="$PackagingType='VR'">Bulk, solid, granular particles (Â“grainsÂ”)</xsl:when>
            <xsl:when test="$PackagingType='VS'">Bulk, scrap metal</xsl:when>
            <xsl:when test="$PackagingType='VY'">Bulk, solid, fine particles (Â“powdersÂ”)</xsl:when>
            <xsl:when test="$PackagingType='WA'">Intermediate bulk container</xsl:when>
            <xsl:when test="$PackagingType='WB'">Wickerbottle</xsl:when>
            <xsl:when test="$PackagingType='WC'">Intermediate bulk container, steel</xsl:when>
            <xsl:when test="$PackagingType='WD'">Intermediate bulk container, aluminium</xsl:when>
            <xsl:when test="$PackagingType='WF'">Intermediate bulk container, metal</xsl:when>
            <xsl:when test="$PackagingType='WG'">Intermediate bulk container, steel, pressurised > 10 kpa</xsl:when>
            <xsl:when test="$PackagingType='WH'">Intermediate bulk container, aluminium, pressurised > 10 kpa</xsl:when>
            <xsl:when test="$PackagingType='WJ'">Intermediate bulk container, metal, pressure 10 kpa</xsl:when>
            <xsl:when test="$PackagingType='WK'">Intermediate bulk container, steel, liquid</xsl:when>
            <xsl:when test="$PackagingType='WL'">Intermediate bulk container, aluminium, liquid</xsl:when>
            <xsl:when test="$PackagingType='WM'">Intermediate bulk container, metal, liquid</xsl:when>
            <xsl:when test="$PackagingType='WN'">Intermediate bulk container, woven plastic, without coat/liner</xsl:when>
            <xsl:when test="$PackagingType='WP'">Intermediate bulk container, woven plastic, coated</xsl:when>
            <xsl:when test="$PackagingType='WQ'">Intermediate bulk container, woven plastic, with liner</xsl:when>
            <xsl:when test="$PackagingType='WR'">Intermediate bulk container, woven plastic, coated and liner</xsl:when>
            <xsl:when test="$PackagingType='WS'">Intermediate bulk container, plastic film</xsl:when>
            <xsl:when test="$PackagingType='WT'">Intermediate bulk container, textile with out coat/liner</xsl:when>
            <xsl:when test="$PackagingType='WU'">Intermediate bulk container, natural wood, with inner liner</xsl:when>
            <xsl:when test="$PackagingType='WV'">Intermediate bulk container, textile, coated</xsl:when>
            <xsl:when test="$PackagingType='WW'">Intermediate bulk container, textile, with liner</xsl:when>
            <xsl:when test="$PackagingType='WX'">Intermediate bulk container, textile, coated and liner</xsl:when>
            <xsl:when test="$PackagingType='WY'">Intermediate bulk container, plywood, with inner liner</xsl:when>
            <xsl:when test="$PackagingType='WZ'">Intermediate bulk container, reconstituted wood, with inner liner</xsl:when>
            <xsl:when test="$PackagingType='XA'">Bag, woven plastic, without inner coat/liner</xsl:when>
            <xsl:when test="$PackagingType='XB'">Bag, woven plastic, sift proof</xsl:when>
            <xsl:when test="$PackagingType='XC'">Bag, woven plastic, water resistant</xsl:when>
            <xsl:when test="$PackagingType='XD'">Bag, plastics film</xsl:when>
            <xsl:when test="$PackagingType='XF'">Bag, textile, without inner coat/liner</xsl:when>
            <xsl:when test="$PackagingType='XG'">Bag, textile, sift proof</xsl:when>
            <xsl:when test="$PackagingType='XH'">Bag, textile, water resistant</xsl:when>
            <xsl:when test="$PackagingType='XJ'">Bag, paper, multi-wall</xsl:when>
            <xsl:when test="$PackagingType='XK'">Bag, paper, multi-wall, water resistant</xsl:when>
            <xsl:when test="$PackagingType='YA'">Composite packaging, plastic receptacle in steel drum</xsl:when>
            <xsl:when test="$PackagingType='YB'">Composite packaging, plastic receptacle in steel crate box</xsl:when>
            <xsl:when test="$PackagingType='YC'">Composite packaging, plastic receptacle in aluminium drum</xsl:when>
            <xsl:when test="$PackagingType='YD'">Composite packaging, plastic receptacle in aluminium crate</xsl:when>
            <xsl:when test="$PackagingType='YF'">Composite packaging, plastic receptacle in wooden box</xsl:when>
            <xsl:when test="$PackagingType='YG'">Composite packaging, plastic receptacle in plywood drum</xsl:when>
            <xsl:when test="$PackagingType='YH'">Composite packaging, plastic receptacle in plywood box</xsl:when>
            <xsl:when test="$PackagingType='YJ'">Composite packaging, plastic receptacle in fibre drum</xsl:when>
            <xsl:when test="$PackagingType='YK'">Composite packaging, plastic receptacle in fibreboard box</xsl:when>
            <xsl:when test="$PackagingType='YL'">Composite packaging, plastic receptacle in plastic drum</xsl:when>
            <xsl:when test="$PackagingType='YM'">Composite packaging, plastic receptacle in solid plastic box</xsl:when>
            <xsl:when test="$PackagingType='YN'">Composite packaging, glass receptacle in steel drum</xsl:when>
            <xsl:when test="$PackagingType='YP'">Composite packaging, glass receptacle in steel crate box</xsl:when>
            <xsl:when test="$PackagingType='YQ'">Composite packaging, glass receptacle in aluminium drum</xsl:when>
            <xsl:when test="$PackagingType='YR'">Composite packaging, glass receptacle in aluminium crate</xsl:when>
            <xsl:when test="$PackagingType='YS'">Composite packaging, glass receptacle in wooden box</xsl:when>
            <xsl:when test="$PackagingType='YT'">Composite packaging, glass receptacle in plywood drum</xsl:when>
            <xsl:when test="$PackagingType='YV'">Composite packaging, glass receptacle in wickerwork hamper</xsl:when>
            <xsl:when test="$PackagingType='YW'">Composite packaging, glass receptacle in fibre drum</xsl:when>
            <xsl:when test="$PackagingType='YX'">Composite packaging, glass receptacle in fibreboard box</xsl:when>
            <xsl:when test="$PackagingType='YY'">Composite packaging, glass receptacle in expandable plastic pack</xsl:when>
            <xsl:when test="$PackagingType='YZ'">Composite packaging, glass receptacle in solid plastic pack</xsl:when>
            <xsl:when test="$PackagingType='ZA'">Intermediate bulk container, paper, multi-wall</xsl:when>
            <xsl:when test="$PackagingType='ZB'">Bag, large</xsl:when>
            <xsl:when test="$PackagingType='ZC'">Intermediate bulk container, paper, multi-wall, water resistant</xsl:when>
            <xsl:when test="$PackagingType='ZD'">Intermediate bulk container, rigid plastic, with structural equipment, solids</xsl:when>
            <xsl:when test="$PackagingType='ZF'">Intermediate bulk container, rigid plastic, freestanding, solids</xsl:when>
            <xsl:when test="$PackagingType='ZG'">Intermediate bulk container, rigid plastic, with structural equipment, pressurised</xsl:when>
            <xsl:when test="$PackagingType='ZH'">Intermediate bulk container, rigid plastic, freestanding, pressurised</xsl:when>
            <xsl:when test="$PackagingType='ZJ'">Intermediate bulk container, rigid plastic, with structural equipment, liquids</xsl:when>
            <xsl:when test="$PackagingType='ZK'">Intermediate bulk container, rigid plastic, freestanding, liquids</xsl:when>
            <xsl:when test="$PackagingType='ZL'">Intermediate bulk container, composite, rigid plastic, solids</xsl:when>
            <xsl:when test="$PackagingType='ZM'">Intermediate bulk container, composite, flexible plastic, solids</xsl:when>
            <xsl:when test="$PackagingType='ZN'">Intermediate bulk container, composite, rigid plastic, pressurised</xsl:when>
            <xsl:when test="$PackagingType='ZP'">Intermediate bulk container, composite, flexible plastic, pressurised</xsl:when>
            <xsl:when test="$PackagingType='ZQ'">Intermediate bulk container, composite, rigid plastic, liquids</xsl:when>
            <xsl:when test="$PackagingType='ZR'">Intermediate bulk container, composite, flexible plastic, liquids</xsl:when>
            <xsl:when test="$PackagingType='ZS'">Intermediate bulk container, composite</xsl:when>
            <xsl:when test="$PackagingType='ZT'">Intermediate bulk container, fibreboard</xsl:when>
            <xsl:when test="$PackagingType='ZU'">Intermediate bulk container, flexible</xsl:when>
            <xsl:when test="$PackagingType='ZV'">Intermediate bulk container, metal, other than steel</xsl:when>
            <xsl:when test="$PackagingType='ZW'">Intermediate bulk container, natural wood</xsl:when>
            <xsl:when test="$PackagingType='ZX'">Intermediate bulk container, plywood</xsl:when>
            <xsl:when test="$PackagingType='ZY'">Intermediate bulk container, reconstituted wood</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$PackagingType"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="/">
        <xsl:comment>eFinans Şablon Tasarım Aracı İle Hazırlanmıştır.</xsl:comment>
        <html>
            <head>
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <title>
                    <xsl:text disable-output-escaping="yes">
                        <![CDATA[e-Fatura]]>
                    </xsl:text>
                </title>
                <style type="text/css">
                    .ph {overflow:hidden;max-height:250px;}
                    .ph7 {margin-bottom:18px;}
                    .ph8 img {margin-bottom: 18px;}
                    .ph10 {
                    float: left;
                    width: 295px;
                    margin-top: 14px;
                    margin-right: 12px;
                    padding: 8px;
                    }
                    body {
                    background-color: #FFFFFF;
                    font-family: 'Tahoma', "Times New Roman", Times, serif;
                    font-size: 11px;
                    color: #666666;
                    margin-left=0.6in;
                    margin-right=0.6in;
                    margin-top=0.79in;
                    margin-bottom=0.79in;
                    }
                    table {font-size: 11px;border-spacing:0;}
                    .documentContainer {
                    min-width:800px;
                    max-width:800px;
                    padding-top: 22px;
                    }
                    .documentContainer a {pointer-events:none;}
                    #ustBolum {margin-bottom: 15px;}
                    .box{display: inline-block;*display: inline;zoom: 1;width: 33%; box-sizing:border-box; vertical-align: top;}
                    #b1{width: 40%;}
                    #b2{width: 25%;}
                    #b3{width: 35%;}
                    #kunye {border-spacing:0;}
                    #kunye tr{border-bottom: 1px dotted gray;}
                    #kunye td{border:1px solid gray;border-top: none;width: 100%;}
                    #kunye th{vertical-align:top;font-weight:bold;white-space: nowrap;border:1px solid gray;border-top: none;border-right: none;text-align:left;border-collapse:collapse;}
                    #kunye tr:first-child td{border-top: 1px solid gray;}
                    #kunye tr:first-child th{border-top: 1px solid gray;}
                    #kunye td:nth-child(2) {word-break: break-all;}
                    #malHizmetTablosu {width:100%;}
                    #malHizmetTablosu, .toplamlar table {
                    border-width: 2px;
                    border-style: inset;
                    border-color: black;
                    border-collapse: collapse;
                    }
                    #malHizmetTablosu tr {}
                    #malHizmetTablosu th {text-align:right;}
                    #malHizmetTablosu th, .toplamlar table th {border: 1px solid black;text-align:right;}
                    .toplamlar table th {line-height:17px;}
                    .toplamlar table th.is-long-true,
                    #malHizmetTablosu > tbody > tr > td .is-long-true {white-space:normal;}
                    #malHizmetTablosu td {text-align: right;}
                    #malHizmetTablosu td.wrap {
                    white-space: normal;
                    text-align: left;
                    }
                    #malHizmetTablosu td , .toplamlar table td {border: 1px solid black;}
                    #malHizmetTablosu th.alignLeft {text-align:left;width: 50%;}
                    #toplamlarContainer {overflow:hidden;}
                    .toplamlar > div {
                    display: inline-block;
                    }
                    .toplamlar table td {text-align: right;}
                    .toplamTablo{
                    margin-left: 31px;
                    float:right;
                    }
                    #AccountingSupplierParty {
                    border-top: 3px solid black;
                    border-bottom: 3px solid black;
                    padding-top: 8px;
                    padding-bottom: 8px;
                    margin-bottom: 12px;                        
                    }
                    .alici {
                    border-top: 3px solid black;
                    padding-top: 8px;
                    margin-top: 80px;
                    border-bottom: 3px solid black;
                    margin-bottom: 8px;
                    padding-bottom: 8px;
                    }
                    .efaturaLogo {text-align:center;}
                    .efaturaLogo img {width:91px;}
                    h1, h2 {
                    padding-bottom: 3px;
                    padding-top: 3px;
                    margin-bottom: 5px;
                    text-transform: uppercase;
                    font-family: Arial, Helvetica, sans-serif;
                    }
                    h1 {
                    font-size: 1.4em;
                    text-transform:none;
                    }
                    h2 {
                    font-size: 1em;
                    color: brown;
                    }
                    h3 {
                    font-size: 1em;
                    color: #333333;
                    text-align: justify;
                    margin: 0;
                    padding: 0;
                    }
                    h4 {
                    font-size: 1.1em;
                    font-style: bold;
                    font-family: Arial, Helvetica, sans-serif;
                    color: #000000;
                    margin: 0;
                    padding: 0;
                    }
                    hr {
                    height:2px;
                    color: #000000;
                    background-color: #000000;
                    border-bottom: 1px solid #000000;
                    }
                    p, ul, ol {
                    margin-top: 1.5em;
                    }
                    ul, ol {
                    margin-left: 3em;
                    }
                    blockquote {
                    margin-left: 3em;
                    margin-right: 3em;
                    font-style: italic;
                    }
                    a {
                    text-decoration: none;
                    color: #70A300;
                    }
                    a:hover {
                    border: none;
                    color: #70A300;
                    }
                    #notlar {
                    border: 2px solid black;
                    margin-top: 13px;
                    padding: 2px 2px 2px 20px;}
                    @media print {
                    body {margin:0;}
                    }
                    #ihracatBilgileri{
                    border:2px solid black;
                    margin-top:10px;
                    padding:10px;
                    position:relative;
                    }
                </style>
            </head>
            <body>
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
                            <xsl:for-each select="n1:Invoice">
                                <xsl:for-each select="cac:AccountingSupplierParty">
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
                            <xsl:for-each
                                select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI">
                                <div class="WebsiteURI">
                                    <xsl:text>Web Sitesi: </xsl:text>
                                    <xsl:value-of select="."/>
                                </div>
                            </xsl:for-each>
                            <div class="taxOffice">
                                <xsl:text>Vergi Dairesi: </xsl:text>
                                <xsl:value-of
                                    select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name"
                                    />
                            </div>
                            <xsl:for-each
                                select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
                                <div class="./partyID">
                                    <xsl:choose>
                                        <xsl:when test="./cbc:ID/@schemeID = 'TICARETSICILNO'">
                                            <xsl:text>Ticaret Sicil No</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="./cbc:ID/@schemeID = 'MERSISNO'">
                                            <xsl:text>MERSİS No</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="./cbc:ID/@schemeID"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text>: </xsl:text>
                                    <xsl:value-of select="./cbc:ID"/>
                                </div>
                            </xsl:for-each>
                            <div class="ph empty ph2">
                                <xsl:text disable-output-escaping="yes">
                                    <![CDATA[Mersis NO: 0757082903500001<br/> Müşteri Hizmetleri: +90 (312) 472 34 34
                                        ]]>
                                </xsl:text>
                            </div>
                        </div>
                        <div class="alici kutu">
                            <div class="customerTitle">
                                <xsl:text>SAYIN</xsl:text>
                            </div>
                            <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID = 'IHRACAT'">
                                <b>
                                    <xsl:text>Unvanı: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name">
                                    <xsl:value-of select="." />
                                </xsl:for-each>
                                <br />
                                <b>
                                    <xsl:text>İli: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                                <br />
                                <b>
                                    <xsl:text>İlçesi: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                                <br />
                                <b>
                                    <xsl:text>Sokak: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                                <br />
                                <b>
                                    <xsl:text>Ülkesi: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                                <br />
                                <b>
                                    <xsl:text>Resmi Unvanı: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                                <br />
                                <b>
                                    <xsl:text>Vergi Numarası: </xsl:text>
                                </b>
                                <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID != 'IHRACAT'">
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
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID != 'IHRACAT'">
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
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone !='' or //n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax !=''">
                                <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID != 'IHRACAT'">
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
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail != ''">
                                <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID != 'IHRACAT'">
                                    <xsl:for-each
                                        select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail">
                                        <div class="eMail">
                                            <xsl:text>e-Posta: </xsl:text>
                                            <xsl:value-of select="."/>
                                        </div>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID != 'IHRACAT'">
                                <div class="taxOffice">
                                    <xsl:text>Vergi Dairesi: </xsl:text>
                                    <xsl:value-of
                                        select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name"
                                        />
                                </div>
                            </xsl:if>
                            <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID != 'IHRACAT'">
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
                            </xsl:if>
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
                        <div class="efaturaLogo">
                            <img style="width:91px;" align="middle" alt="E-Fatura Logo"
                                src="data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzMiA3OS4xNTkyODQsIDIwMTYvMDQvMTktMTM6MTM6NDAgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjZDNDJBNEI2QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjZDNDJBNEI1QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzREVENkU1N0FDREVDNEJBNzkxNUM2M0NCN0RENzM0NyIgc3RSZWY6ZG9jdW1lbnRJRD0iM0RFRDZFNTdBQ0RFQzRCQTc5MTVDNjNDQjdERDczNDciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB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"/>
                            <h1>
                                <xsl:text>e-Fatura</xsl:text>
                            </h1>
                        </div>
                        <div class="ph empty ph6">
                            <xsl:text disable-output-escaping="yes">
                                <![CDATA[<div style="text-align: center;"> </div>
                                    <div style="text-align: center;"> </div>
                                    <div style="text-align: center;">
                                        
                                    </div>
                                    ]]>
                            </xsl:text>
                        </div>
                    </div>
                    <div id="b3" class="box">
                        <div id="despatchTable">
                            <div class="ph empty ph7">
                                <xsl:text disable-output-escaping="yes">
                                    <![CDATA[<div style="text-align: center;"><img style="width:150px;" src="data:image/png;base64,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" align="center"/></div>
                                        ]]>
                                </xsl:text>
                            </div>
                            <div style="clear:both;"/>
                                <table id="kunye">
                                    <tbody>
                                        <tr>
                                            <th>
                                                <xsl:text>Tarih:</xsl:text>
                                            </th>
                                            <td>
                                                <xsl:for-each select="n1:Invoice">
                                                    <xsl:for-each select="cbc:IssueDate">
                                                        <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
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
                                        <xsl:if test="//n1:Invoice/cbc:AccountingCost">
                                            <tr>
                                                <th>
                                                    <xsl:text>Fatura Alt Tipi:</xsl:text>
                                                </th>
                                                <td>
                                                    <xsl:for-each select="n1:Invoice">
                                                        <xsl:for-each select="cbc:AccountingCost">
                                                            <xsl:apply-templates/>
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:DocumentType = 'İade Edilen Fatura'] or //n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
                                            <xsl:choose>
                                                <xsl:when test="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
                                                    <tr>
                                                        <th style="vertical-align:top;">
                                                            <xsl:text>İade Fatura No:</xsl:text>
                                                        </th>
                                                        <td>
                                                            <xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference[cbc:DocumentType = 'İade Edilen Fatura']">
                                                                <xsl:if test="position() !=1">
                                                                    <br/>
                                                                </xsl:if>
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
                                                                <xsl:if test="position() !=1">
                                                                    <br/>
                                                                </xsl:if>
                                                                <xsl:value-of select="substring(cbc:IssueDate,9,2)"
                                                                    />
                                                                -
                                                                <xsl:value-of select="substring(cbc:IssueDate,6,2)"
                                                                    />
                                                                -
                                                                <xsl:value-of select="substring(cbc:IssueDate,1,4)"/>
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
                                                                <xsl:if test="position() !=1">
                                                                    <br/>
                                                                </xsl:if>
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
                                                                <xsl:if test="position() !=1">
                                                                    <br/>
                                                                </xsl:if>
                                                                <xsl:value-of select="substring(cbc:IssueDate,9,2)"/>-<xsl:value-of select="substring(cbc:IssueDate,6,2)"/>-<xsl:value-of select="substring(cbc:IssueDate,1,4)"/>
                                                            </xsl:for-each>
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:if>
                                        <xsl:for-each
                                            select="n1:Invoice/cac:DespatchDocumentReference">
                                            <tr>
                                                <th>
                                                    <xsl:text>İrsaliye No:</xsl:text>
                                                </th>
                                                <td>
                                                    <xsl:call-template name="removeLeadingZeros">
                                                        <xsl:with-param name="originalString" select="cbc:ID"/>
                                                    </xsl:call-template>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <xsl:text>İrsaliye Tarihi:</xsl:text>
                                                </th>
                                                <td>
                                                    <xsl:for-each select="cbc:IssueDate">
                                                        <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                        <xsl:if test="//n1:Invoice/cac:OrderReference">
                                            <tr>
                                                <th>
                                                    <xsl:text>Sipariş No:</xsl:text>
                                                </th>
                                                <td>
                                                    <xsl:for-each
                                                        select="n1:Invoice/cac:OrderReference">
                                                        <xsl:for-each select="cbc:ID">
                                                            <xsl:apply-templates/>
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <xsl:text>Sipariş Tarihi:</xsl:text>
                                                </th>
                                                <td>
                                                    <xsl:for-each
                                                        select="n1:Invoice/cac:OrderReference">
                                                        <xsl:for-each select="cbc:IssueDate">
                                                            <xsl:value-of select="substring(.,9,2)"
                                                                />
                                                            -
                                                            <xsl:value-of select="substring(.,6,2)"
                                                                />
                                                            -
                                                            <xsl:value-of select="substring(.,1,4)"/>
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                        <xsl:if test="//n1:Invoice/cac:PaymentMeans/cbc:PaymentDueDate or //n1:Invoice/cac:PaymentTerms/cbc:PaymentDueDate">
                                            <xsl:choose>
                                                <xsl:when test="//n1:Invoice/cac:PaymentTerms/cbc:PaymentDueDate">
                                                    <tr>
                                                        <th>
                                                            <xsl:text>Son Ödeme Tarihi:</xsl:text>
                                                        </th>
                                                        <td>
                                                            <xsl:for-each select="n1:Invoice/cac:PaymentTerms">
                                                                <xsl:for-each select="cbc:PaymentDueDate">
                                                                    <xsl:value-of select="substring(.,9,2)"/>
                                                                    -
                                                                    <xsl:value-of select="substring(.,6,2)"/>
                                                                    -
                                                                    <xsl:value-of select="substring(.,1,4)"/>
                                                                    <br/>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:if test="//n1:Invoice/cac:PaymentMeans/cbc:PaymentDueDate">
                                                        <tr>
                                                            <th>
                                                                <xsl:text>Son Ödeme Tarihi:</xsl:text>
                                                            </th>
                                                            <td>
                                                                <xsl:for-each select="n1:Invoice/cac:PaymentMeans">
                                                                    <xsl:for-each select="cbc:PaymentDueDate">
                                                                        <xsl:value-of select="substring(.,9,2)"/>
                                                                        -
                                                                        <xsl:value-of select="substring(.,6,2)"/>
                                                                        -
                                                                        <xsl:value-of select="substring(.,1,4)"/>
                                                                        <br/>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </td>
                                                        </tr>
                                                    </xsl:if>
                                                </xsl:otherwise>
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
                                    <th data-id="SATIRLAR_SIRANO" style="text-align:left;">
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
                                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric and //n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric !=0">
                                        <th data-id="SATIRLAR_ISKONTOORANI">
                                            <xsl:text>İskonto/Artırım Oranı</xsl:text>
                                        </th>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge">
                                        <th data-id="SATIRLAR_ISKONTOTUTARI">
                                            <xsl:text>İskonto/(A)rtırım Tutarı</xsl:text>
                                        </th>
                                    </xsl:if>
                                    <th data-id="SATIRLAR_MHTUTARI" class="mhColumn">
                                        <xsl:text>Mal Hizmet Tutarı</xsl:text>
                                    </th>
                                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
                                        <th data-id="SATIRLAR_KDVORANI">
                                            <xsl:text>KDV Oranı</xsl:text>
                                        </th>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
                                        <th data-id="SATIRLAR_KDVTUTARI">
                                            <xsl:text>KDV Tutarı</xsl:text>
                                        </th>
                                        <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                                                <th>
                                                    <span style="font-weight:bold;">
                                                        <xsl:text>Teslim Şartı</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                                                <th>
                                                    <span style="font-weight:bold; width:5%;">
                                                        <xsl:text>Eşya Kap Cinsi</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                                                <th>
                                                    <span style="font-weight:bold;">
                                                        <xsl:text>Kap No</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                                                <th>
                                                    <span style="font-weight:bold;">
                                                        <xsl:text>Kap Adet</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryAddress">
                                                <th>
                                                    <span>
                                                        <xsl:text>Teslim/Bedel Ödeme Yeri</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                                                <th>
                                                    <span style="font-weight:bold;">
                                                        <xsl:text>Gönderilme Şekli</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                                                <th>
                                                    <span style="font-weight:bold;">
                                                        <xsl:text>GTİP</xsl:text>
                                                    </span>
                                                </th>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode > 0">
                                        <th data-id="SATIRLAR_VERGIIADEMUAFIYET">
                                            <xsl:text>Vergi İ.M. Sebebi</xsl:text>
                                        </th>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode !='0015' or //n1:Invoice/cac:InvoiceLine/cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                                        <th data-id="SATIRLAR_DIGERVERGI">
                                            <xsl:text>Diğer Vergiler</xsl:text>
                                        </th>
                                    </xsl:if>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
                                            <xsl:apply-templates select="."/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </xsl:for-each>
                <br />
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
                                    <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                                        <tr>
                                            <th>
                                                <xsl:text>Nakliye:</xsl:text>
                                            </th>
                                            <td>
                                                <xsl:choose>
                                                    <xsl:when test="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:DeclaredForCarriageValueAmount">
                                                        <xsl:value-of
                                                            select="format-number(//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:DeclaredForCarriageValueAmount, '###.##0,00', 'european')"/>
                                                        <xsl:if
                                                            test="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:DeclaredForCarriageValueAmount/@currencyID">
                                                            <xsl:text> </xsl:text>
                                                            <span>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                    <xsl:text>TL</xsl:text>
                                                                </xsl:if>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                    <xsl:value-of
                                                                        select="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:DeclaredForCarriageValueAmount/@currencyID"
                                                                        />
                                                                </xsl:if>
                                                            </span>
                                                        </xsl:if>
                                                    </xsl:when>
                                                    <xsl:when test="//n1:Invoice/cac:Delivery/cac:Shipment/cbc:DeclaredForCarriageValueAmount">
                                                        <xsl:value-of
                                                            select="format-number(//n1:Invoice/cac:Delivery/cac:Shipment/cbc:DeclaredForCarriageValueAmount, '###.##0,00', 'european')"/>
                                                        <xsl:if
                                                            test="//n1:Invoice/cac:Delivery/cac:Shipment/cbc:DeclaredForCarriageValueAmount/@currencyID">
                                                            <xsl:text> </xsl:text>
                                                            <span>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                    <xsl:text>TL</xsl:text>
                                                                </xsl:if>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                    <xsl:value-of
                                                                        select="//n1:Invoice/cac:Delivery/cac:Shipment/cbc:DeclaredForCarriageValueAmount/@currencyID"
                                                                        />
                                                                </xsl:if>
                                                            </span>
                                                        </xsl:if>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="format-number(0, '###.##0,00', 'european')"/>
                                                        <xsl:text> </xsl:text>
                                                        <span>
                                                            <xsl:if
                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                <xsl:text>TL</xsl:text>
                                                            </xsl:if>
                                                            <xsl:if
                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                <xsl:value-of
                                                                    select="//n1:Invoice/cbc:DocumentCurrencyCode"
                                                                    />
                                                            </xsl:if>
                                                        </span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                                        <tr>
                                            <th>
                                                <xsl:text>Sigorta:</xsl:text>
                                            </th>
                                            <td>
                                                <xsl:choose>
                                                    <xsl:when test="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:InsuranceValueAmount">
                                                        <xsl:value-of
                                                            select="format-number(//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:InsuranceValueAmount, '###.##0,00', 'european')"/>
                                                        <xsl:if
                                                            test="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:InsuranceValueAmount/@currencyID">
                                                            <xsl:text> </xsl:text>
                                                            <span>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                    <xsl:text>TL</xsl:text>
                                                                </xsl:if>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                    <xsl:value-of
                                                                        select="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:InsuranceValueAmount/@currencyID"
                                                                        />
                                                                </xsl:if>
                                                            </span>
                                                        </xsl:if>
                                                    </xsl:when>
                                                    <xsl:when test="//n1:Invoice/cac:Delivery/cac:Shipment/cbc:InsuranceValueAmount">
                                                        <xsl:value-of
                                                            select="format-number(//n1:Invoice/cac:Delivery/cac:Shipment/cbc:InsuranceValueAmount, '###.##0,00', 'european')"/>
                                                        <xsl:if
                                                            test="//n1:Invoice/cac:Delivery/cac:Shipment/cbc:InsuranceValueAmount/@currencyID">
                                                            <xsl:text> </xsl:text>
                                                            <span>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                    <xsl:text>TL</xsl:text>
                                                                </xsl:if>
                                                                <xsl:if
                                                                    test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                    <xsl:value-of
                                                                        select="//n1:Invoice/cac:Delivery/cac:Shipment/cbc:InsuranceValueAmount/@currencyID"
                                                                        />
                                                                </xsl:if>
                                                            </span>
                                                        </xsl:if>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="format-number(0, '###.##0,00', 'european')"/>
                                                        <xsl:text> </xsl:text>
                                                        <span>
                                                            <xsl:if
                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                                <xsl:text>TL</xsl:text>
                                                            </xsl:if>
                                                            <xsl:if
                                                                test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                                <xsl:value-of
                                                                    select="//n1:Invoice/cbc:DocumentCurrencyCode"
                                                                    />
                                                            </xsl:if>
                                                        </span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount !=0">
                                        <tr>
                                            <th>
                                                <xsl:text>Toplam İskonto: </xsl:text>
                                            </th>
                                            <td>
                                                <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, '###.##0,00', 'european')"/>
                                                <xsl:if
                                                    test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID">
                                                    <xsl:text> </xsl:text>
                                                    <span>
                                                        <xsl:if
                                                            test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                            <xsl:text>TL</xsl:text>
                                                        </xsl:if>
                                                        <xsl:if
                                                            test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                            <xsl:value-of
                                                                select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID"
                                                                />
                                                        </xsl:if>
                                                    </span>
                                                </xsl:if>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount !=0">
                                        <tr>
                                            <th>
                                                <xsl:text>Toplam Artırım:</xsl:text>
                                            </th>
                                            <td>
                                                <xsl:value-of
                                                    select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount, '###.##0,00', 'european')"/>
                                                <xsl:if
                                                    test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount/@currencyID">
                                                    <xsl:text> </xsl:text>
                                                    <span>
                                                        <xsl:if
                                                            test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                            <xsl:text>TL</xsl:text>
                                                        </xsl:if>
                                                        <xsl:if
                                                            test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                            <xsl:value-of
                                                                select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount/@currencyID"
                                                                />
                                                        </xsl:if>
                                                    </span>
                                                </xsl:if>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode='0015']">
                                        <tr>
                                            <th>
                                                <xsl:text>KDV Matrahı </xsl:text>
                                                <xsl:text>(%</xsl:text>
                                                <xsl:value-of select="cbc:Percent"/>
                                                <xsl:text>):</xsl:text>
                                            </th>
                                            <td>
                                                <xsl:value-of
                                                    select="format-number(./cbc:TaxableAmount[../cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode='0015'], '###.##0,00', 'european')"/>
                                                <xsl:if
                                                    test="./cbc:TaxableAmount/@currencyID">
                                                    <xsl:text> </xsl:text>
                                                    <span>
                                                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                            <xsl:text>TL</xsl:text>
                                                        </xsl:if>
                                                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                            <xsl:value-of
                                                                select="./cbc:TaxableAmount/@currencyID"/>
                                                        </xsl:if>
                                                    </span>
                                                </xsl:if>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                    <tr>
                                        <th class="sumTitle">
                                            <span>
                                                <xsl:text>Vergi Hariç Tutar: </xsl:text>
                                            </span>
                                        </th>
                                        <td class="sumValue">
                                            <xsl:value-of
                                                select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount, '###.##0,00', 'european')"/>
                                            <xsl:if
                                                test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount">
                                                <xsl:text> </xsl:text>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text>TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:value-of
                                                            select="
                                                            //n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount/@currencyID"
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
                                                    (
                                                    <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>
                                                    )
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
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]">
                                        <tr>
                                            <th class="sumTitle">
                                                <xsl:text>Tevkifata Tabi İşlem Tutarı (KDV): </xsl:text>
                                            </th>
                                            <td class="sumValue">
                                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount[../../../cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')] and ../cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode =0015]), '###.##0,00', 'european')"/>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text> TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                    </xsl:if>
                                                </span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]">
                                        <tr>
                                            <th>
                                                <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV: </xsl:text>
                                            </th>
                                            <td class="sumValue">
                                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal/cbc:TaxableAmount[starts-with(../cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]), '###.##0,00', 'european')"/>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text> TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                    </xsl:if>
                                                </span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]">
                                        <xsl:for-each select="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]">
                                            <tr>
                                                <th>
                                                    <xsl:text>KDV Tevkifat Tutarı (</xsl:text>
                                                    <xsl:value-of select="./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                                                    ):
                                                </th>
                                                <td class="sumValue">
                                                    <xsl:value-of select="format-number(cbc:TaxAmount, '###.##0,00', 'european')"/>
                                                    <span>
                                                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                            <xsl:text> TL</xsl:text>
                                                        </xsl:if>
                                                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                            <xsl:text> </xsl:text>
                                                            <xsl:value-of select="//n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                        </xsl:if>
                                                    </span>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4')]">
                                        <tr>
                                            <th>
                                                <xsl:text>Tevkifata Tabi İşlem Tutarı (ÖTV)</xsl:text>
                                            </th>
                                            <td class="sumValue">
                                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount[../../../cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4') and ../cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode =0071]]), '###.##0,00', 'european')"/>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text> TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                    </xsl:if>
                                                </span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4')]">
                                        <tr>
                                            <th>
                                                <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. ÖTV</xsl:text>
                                            </th>
                                            <td class="sumValue">
                                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal/cbc:TaxableAmount[starts-with(../cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4')]), '###.##0,00', 'european')"/>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text> TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                    </xsl:if>
                                                </span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4')]">
                                        <xsl:for-each select="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4')]">
                                            <tr>
                                                <th>
                                                    <xsl:text>ÖTV Tevkifat Tutarı (</xsl:text>
                                                    <xsl:value-of select="./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                                                    ):
                                                </th>
                                                <td class="sumValue">
                                                    <xsl:value-of select="../cbc:TaxAmount"/>
                                                    <span>
                                                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                            <xsl:text> TL</xsl:text>
                                                        </xsl:if>
                                                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                            <xsl:text> </xsl:text>
                                                            <xsl:value-of select="//n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                        </xsl:if>
                                                    </span>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount)>0">
                                        <tr>
                                            <th>
                                                <xsl:text>Tevkifata Tabi İşlem Tutarı:</xsl:text>
                                            </th>
                                            <td class="sumValue">
                                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount), '###.##0,00', 'european')"/>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text>TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                    </xsl:if>
                                                </span>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount)>0">
                                        <tr>
                                            <th>
                                                <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV:</xsl:text>
                                            </th>
                                            <td class="sumValue">
                                                <xsl:value-of select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount), '###.##0,00', 'european')"/>
                                                <span>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                                        <xsl:text>TL</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                                        <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                                    </xsl:if>
                                                </span>
                                            </td>
                                        </tr>
                                    </xsl:if>
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
                <xsl:if test="//n1:Invoice/cbc:ProfileID != 'YOLCUBERABERFATURA' and //n1:Invoice/cbc:ProfileID = 'IHRACAT'">
                    <div id="ihracatBilgileri">
                        <table width="100%" border="0">
                            <tbody>
                                <tr>
                                    <th align="left">Eşya Bilgileri</th>
                                    <th align="left">Adres Bilgileri</th>
                                </tr>
                                <tr>
                                    <td valign="top" width="50%">
                                        <xsl:text>Teslim Şartı: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>Gönderilme Şekli: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                                            <xsl:call-template name="TransportMode">
                                                <xsl:with-param name="TransportModeType">
                                                    <xsl:value-of select="."/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>GTİP No: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>Eşya Kap Cinsi: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                                            <xsl:call-template name="Packaging">
                                                <xsl:with-param name="PackagingType">
                                                    <xsl:value-of select="."/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </td>
                                    <td vaign="top" width="50%">
                                        <xsl:text>Ülke: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cac:Country/cbc:Name">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>Şehir: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cbc:CityName">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>İlçe: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cbc:CitySubdivisionName">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>Posta Kodu: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cbc:PostalZone">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>Sokak: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cbc:StreetName">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>No: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cbc:BuildingNumber">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                        <xsl:text>Bina Adı: </xsl:text>
                                        <xsl:for-each select="//n1:Invoice/cac:Delivery/cac:DeliveryAddress/cbc:BuildingName">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                        <br />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </xsl:if>
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
                                    <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cbc:TaxExemptionReasonCode,'8') and (string-length(./cac:TaxCategory/cbc:TaxExemptionReasonCode) =3)]">
                                        <span style="font-weight:bold; ">Özel Matrah Kodu: </span>
                                        <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>
                                        - 
                                        <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                                        <br/>
                                        <span style="font-weight:bold; ">Özel Matrah Detayı: </span>
                                        <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                        (
                                        <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                                        )
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
                                    <xsl:if test="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4') or starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]">
                                        <br/>
                                        <span style="display:inline-block;font-weight:bold;  vertical-align: top;padding-right: 4px;">TEVKİFAT DETAYI: </span>
                                        <span style="display:inline-block;">
                                            <xsl:for-each select="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'4') or starts-with(./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'6')]">
                                                <xsl:value-of select="./cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                                                - 
                                                <xsl:value-of select="./cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                                <br/>
                                            </xsl:for-each>
                                        </span>
                                        <div style="clear:both"/>
                                    </xsl:if>
                                    <xsl:if test="count(//n1:Invoice/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject) &gt; 1">
                                    <br/>
                                    <span style="font-weight:bold;">İLAVE DÖKÜMANLAR</span>
                                    <br/>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference and //n1:Invoice/cac:AdditionalDocumentReference/cbc:DocumentType!='XSLT'">
                                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                                    <xsl:if test="./cbc:DocumentType!='XSLT' and not(./cbc:DocumentTypeCode)">
                                    <xsl:if test="./cbc:ID">
                                    <span style="font-weight:bold;">Belge No: </span>
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
                                    <br/>
                                    <span style="font-weight:bold;">ÖDEME ŞEKLİ</span>
                                    <br/>
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
                                    <span style="font-weight:bold;">Son Ödeme Tarihi:</span>&#160;
                                    <xsl:value-of select="substring(cbc:PaymentDueDate,9,2)"
                                        />-<xsl:value-of select="substring(cbc:PaymentDueDate,6,2)"
                                        />-<xsl:value-of select="substring(cbc:PaymentDueDate,1,4)"/>&#160;&#160;&#160;
                                    </xsl:if>
                                    <xsl:if test="cbc:PaymentChannelCode">
                                    <span style="font-weight:bold;">Ödeme Kanalı: </span>&#160;
                                    <xsl:value-of
                                        select="cbc:PaymentChannelCode"/>&#160;&#160;&#160;
                                    </xsl:if>
                                    <xsl:if test="cac:PayeeFinancialAccount/cbc:ID">
                                    <span style="font-weight:bold;"> IBAN / Hesap No: </span>
                                    <xsl:value-of select="cac:PayeeFinancialAccount/cbc:ID"/>
                                    (<xsl:if test="cac:PayeeFinancialAccount/cbc:CurrencyCode = 'TRY' or cac:PayeeFinancialAccount/cbc:CurrencyCode = 'TRL'">
                                    <xsl:text>TL</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="cac:PayeeFinancialAccount/cbc:CurrencyCode != 'TRY' and cac:PayeeFinancialAccount/cbc:CurrencyCode != 'TRL'">
                                    <xsl:value-of select="cac:PayeeFinancialAccount/cbc:CurrencyCode"/>
                                    </xsl:if>)
                                    </xsl:if>
                                    <xsl:if test="cbc:InstructionNote">
                                    <br/>
                                    <span style="font-weight:bold;">Ödeme Şekli Açıklaması: </span>&#160;
                                    <xsl:value-of
                                        select="cbc:InstructionNote"/>&#160;&#160;&#160;
                                    </xsl:if>
                                    <br/>
                                    </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cac:InvoicePeriod">
                                    <br/>
                                    <span style="font-weight:bold;">FATURA DÖNEM BİLGİLERİ</span>
                                    <br/>
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
                                    <span style="font-weight:bold;">Dönem Periyodu / Süresi:</span>&#160;
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
                                    <br/>
                                    <span style="font-weight:bold;">ALINDI BİLGİLERİ</span>
                                    <br/>
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
                                    <br/>
                                    <span style="font-weight:bold;">ÖDEME KOŞULLARI</span>
                                    <br/>
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
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//n1:Invoice/cac:InvoiceLine">
        <tr>
            <td style="text-align:left;">
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
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric and //n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric !=0">
                <td>
                    <span>
                        <xsl:for-each select="./cac:AllowanceCharge">
                            <xsl:if test="./cbc:MultiplierFactorNumeric">
                                <xsl:text> %</xsl:text>
                                <xsl:value-of select="format-number(./cbc:MultiplierFactorNumeric * 100, '###.##0,00', 'european')"/>
                                <br/>
                            </xsl:if>
                        </xsl:for-each>
                    </span>
                </td>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge">
                <td>
                    <span>
                        <xsl:for-each select="./cac:AllowanceCharge">
                            <xsl:if test="./cbc:ChargeIndicator = 'true' and not(./cbc:Amount =0) ">(A)</xsl:if>
                            <xsl:value-of
                                select="format-number(./cbc:Amount, '###.##0,00', 'european')"
                                />
                            <xsl:if test="./cbc:Amount/@currencyID">
                                <xsl:text> </xsl:text>
                                <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                    <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                    <xsl:value-of select="./cbc:Amount/@currencyID"/>
                                </xsl:if>
                            </xsl:if>
                            <br/>
                        </xsl:for-each>
                    </span>
                </td>
            </xsl:if>
            <td>
                <span>
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
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
                <td>
                    <span>
                        <xsl:for-each
                            select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                            <xsl:if test="cbc:TaxTypeCode='0015' ">
                                <xsl:text> </xsl:text>
                                <xsl:value-of
                                    select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                    <xsl:text> </xsl:text>
                                    <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY' or ../../cbc:TaxAmount/@currencyID = 'TRL'">
                                        <xsl:text>TL</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY' and ../../cbc:TaxAmount/@currencyID != 'TRL'">
                                        <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:apply-templates/>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:call-template name="Packaging">
                                    <xsl:with-param name="PackagingType">
                                        <xsl:value-of select="."/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:apply-templates/>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:apply-templates/>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryAddress">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:DeliveryAddress">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:apply-templates/>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:call-template name="TransportMode">
                                    <xsl:with-param name="TransportModeType">
                                        <xsl:value-of select="."/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                        <td class="lineTableTd" align="right">
                            <xsl:text>&#160;</xsl:text>
                            <xsl:for-each select="cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:apply-templates/>
                            </xsl:for-each>
                        </td>
                    </xsl:if>
                </xsl:if>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode > 0">
                <td style="font-size: xx-small;white-space:normal;">
                    <span>
                        <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal[./cac:TaxCategory/cbc:TaxExemptionReasonCode > '0']">
                            <xsl:if test="cac:TaxCategory/cbc:TaxExemptionReasonCode">
                                <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>
                                - 
                                <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                                - 
                                <xsl:value-of select="cac:TaxCategory/cbc:Name"/>
                                <br/>
                            </xsl:if>
                        </xsl:for-each>
                    </span>
                </td>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode !='0015' or //n1:Invoice/cac:InvoiceLine/cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                <td style="font-size: xx-small;">
                    <div>
                        <xsl:for-each
                            select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                            <xsl:if test="cbc:TaxTypeCode!='0015' ">
                                <span class="is-long-{string-length(cbc:Name) > 15}">
                                    <xsl:text> </xsl:text>
                                    <xsl:if test="starts-with(cbc:TaxTypeCode,'4') or starts-with(cbc:TaxTypeCode,'6')">
                                        <xsl:value-of select="cbc:TaxTypeCode"/>
                                        -
                                    </xsl:if>
                                    <xsl:value-of select="cbc:Name"/>
                                    <xsl:if test="../../cbc:Percent">
                                        <xsl:text> (%</xsl:text>
                                        <xsl:value-of
                                            select="format-number(../../cbc:Percent, '###.##0,00', 'european')"
                                            />
                                        <xsl:text>)=</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of
                                        select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                                    <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                        <xsl:text> </xsl:text>
                                        <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY' or ../../cbc:TaxAmount/@currencyID = 'TRL'">
                                            <xsl:text>TL</xsl:text>
                                        </xsl:if>
                                        <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY' and ../../cbc:TaxAmount/@currencyID != 'TRL'">
                                            <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                        </xsl:if>
                                    </xsl:if>
                                    <br/>
                                </span>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each
                            select="./cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                            <xsl:if test="cbc:TaxTypeCode!='0015' ">
                                <span class="is-long-{string-length(cbc:Name) > 15}">
                                    <xsl:if test="starts-with(cbc:TaxTypeCode,'4') or starts-with(cbc:TaxTypeCode,'6')">
                                        <xsl:value-of select="cbc:TaxTypeCode"/>
                                        -
                                    </xsl:if>
                                    <xsl:value-of select="cbc:Name"/>
                                </span>
                                <xsl:if test="../../cbc:Percent">
                                    <xsl:text> (%</xsl:text>
                                    <xsl:value-of
                                        select="format-number(../../cbc:Percent, '###.##0,00', 'european')"
                                        />
                                    <xsl:text>)=</xsl:text>
                                </xsl:if>
                                <xsl:value-of
                                    select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                    <xsl:text> </xsl:text>
                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode = 'TRY' or //n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                        <xsl:text>TL</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                        <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </div>
                </td>
            </xsl:if>
        </tr>
    </xsl:template>
    <xsl:template match="//n1:Invoice">
        <tr>
            <td>
                <span>
                    <xsl:text>&#160;</xsl:text>
                </span>
            </td>
            <td>
                <span>
                    <xsl:text>&#160;</xsl:text>
                </span>
            </td>
            <td>
                <span>
                    <xsl:text>&#160;</xsl:text>
                </span>
            </td>
            <td>
                <span>
                    <xsl:text>&#160;</xsl:text>
                </span>
            </td>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric and //n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge/cbc:MultiplierFactorNumeric !=0">
                <td>
                    <span>
                        <xsl:text>&#160;</xsl:text>
                    </span>
                </td>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:AllowanceCharge">
                <td>
                    <span>
                        <xsl:text>&#160;</xsl:text>
                    </span>
                </td>
            </xsl:if>
            <td>
                <span>
                    <xsl:text>&#160;</xsl:text>
                </span>
            </td>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
                <td>
                    <span>
                        <xsl:text>&#160;</xsl:text>
                    </span>
                </td>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode ='0015'">
                <td>
                    <span>
                        <xsl:text>&#160;</xsl:text>
                    </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:DeliveryAddress">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                    <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                        <td>
                            <span>
                                <xsl:text>&#160;</xsl:text>
                            </span>
                        </td>
                    </xsl:if>
                </xsl:if>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReasonCode > 0">
                <td>
                    <span>
                        <xsl:text>&#160;</xsl:text>
                    </span>
                </td>
            </xsl:if>
            <xsl:if test="//n1:Invoice/cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode !='0015' or //n1:Invoice/cac:InvoiceLine/cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                <td>
                    <span>
                        <xsl:text>&#160;</xsl:text>
                    </span>
                </td>
            </xsl:if>
        </tr>
    </xsl:template>
</xsl:stylesheet>