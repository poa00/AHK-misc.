﻿sort_len(byref str, del := "`n", shortFirst:=true, omitEmpty:=true, init:=false){
	; source, see: 'c souce\sort_len.c'
	local k, i, raw, r
	static flProtect:=0x40, flAllocationType:=0x1000 ; PAGE_EXECUTE_READWRITE ; MEM_COMMIT	
	; binary code:
	static raw32:=strsplit("1398167381,9235585,2223702016,40996,615811840,164,2888084619,1711276032,251672707,247684,1048798720,3179548416,2231369731,3045330925,3338665987,3355714628,3338665984,9220,2499739648,46116,2311095552,608471495,2441350944,3338665987,3355714628,3338665984,9220,2499739648,46116,2311095552,254026820,663684,608487168,51204,604292864,0,3022296319,2231369728,264341952,655492,2382006528,2089488479,1099768868,608995600,609519912,281510688,2467289401,264387009,3389637267,606356537,968987407,254289020,3356082323,2215625348,4345,606358667,1552668985,2467242020,268122562,3255353491,283083791,3632857088,3239043203,3640066792,3800285833,4102295299,3338665986,3,3352267008,1,608996096,33194792,455,2215575552,4313,3338926723,1091,1204224000,4,71419648,0,284787983,1137115136,8,138921728,0,955,138528512,0,12223,3323904,3492347904,472138889,11960,3251644672,3229811432,608471297,48283928,337921161,539249803,9766029,1711276032,2378231567,1284178196,688858148,62980354,254288964,286195985,1109987072,1091637008,1074859792,1109987088,1091637024,1074859808,1109987104,1091637040,1074859824,1109987120,1091637056,1074859840,1109987136,1091637072,1074859856,1109987152,1091637088,1074859872,1109987168,1091637104,1074859888,2183729008,128,2155942159,251658240,8421393,688848896,36994,2165378816,144,2424312079,251658240,10519081,286195712,41089,2148601600,160,405044355,253064460,11567657,286195712,45185,2148601600,176,337921163,1144768297,344792100,1962510616,608471915,612141864,33129248,606362763,9897159,3338665984,37636,80150528,144,21138688,80167540,135,612141824,46301992,3338860931,33540,80150528,135,2334225408,3340772420,36868,1149960192,80159780,144,608471808,2416232232,0,28896645,3120562176,0,3351594255,4203588,3338665984,842802244,2298478592,608471495,2213579092,1153896416,6180,1153892352,3289124,3906011136,3766737143,267925767,3341403975,1149879177,1200440356,612141560,65585496,2298593411,3244041284,3984917472,1612989577,268387725,3347694148,3221346441,1149886249,4026623012,1277459593,1344554121,823150221,612141567,608471340,112660328,740588683,2357975857,40996,608487168,4294967068,1149855487,3062699044,0,2367620237,3071230220,3229967873,996548468,1947477060,29590398,2686749835,2365587456,210575108,28774209,1975551334,29372897,608487363,284,266044672,32645,612666112,160,405030019,1015244289,2215575672,1497,3247042305,2422645483,3296844593,140,1583077513,3351469407,806626372,3338665984,202908740,3204448256,50,472138951,50,1776933681,838860797,29393856,1091876623,1175730534,261784847,3308847104,261260815,2238054400,971142610,1954877381,3925868543,4294967161,740588681,807697547,337927305,2198862649,1697,337935499,1009009803,210630713,4294966461,3343323135,1009009801,1076118667,1108342841,608471495,608471872,2311586088,2335712324,29591808,2311555576,2335450180,2367956036,16792916,608471496,956336968,1132597186,2231369734,1347008,1149965685,4169339940,672435506,3766730777,46170928,64007951,2367693900,1418269188,1149857828,25887780,1814318217,4280550537,11805844,3229941760,236880911,1418395648,1284206628,2089511972,25774116,3263764361,337921163,740588683,1210338441,1149878273,2223704100,40996,2013564160,69485705,2304377997,2499748868,48164,2344649984,256386124,906116,608471808,17402676,18124224,1814316169,337921163,135808141,960562317,1150488518,1413171236,3054463012,256386140,3272130707,204833807,4253220864,746983182,2332033036,2235835516,243535871,251658249,4286777015,42558977,222069775,1149960192,3071226916,3229811294,50299649,1711281293,255925385,870788,1186402048,67076868,289704294,763629314,251658253,2198226615,2305164543,251924804,856452,1186402048,100631304,289704294,4119072518,251658252,2198488759,2305165311,252186948,839557,1186402048,1149855244,129632785,956301312,257172604,58244,612139776,1685456460,1814316171,1680098307,740588683,337927307,1814316231,0,1881429129,1149880321,1149978660,1418416164,1149454372,2197908516,258347200,2213568623,286200002,1418326114,1418414116,1413180452,3664927780,1612989579,1881429131,740588681,337927305,1144635905,2020890660,874806411,1444722447,3489790089,1092389222,956383885,258045637,21372087,478766840,37915969,1349961017,1176286991,2305226753,1116553500,1992636675,481759039,1727529286,2369854601,3308848194,3071225462,4160833052,1092389222,956646029,253589189,21372087,478766840,105024833,209110329,1175762703,874791939,1091864934,337927307,941900939,402778881,740580353,472153219,1451495423,2348810236,11019396,3229941760,116032527,2223702016,45092,264275200,737669,608471808,264275224,734596,759467264,614238976,160,2894713393,44068,608471296,608471852,608471320,273059092,472138889,2366653325,3325628972,1002541839,253502556,3238576275,107643919,3162701824,44068,2249133568,1628,1143229579,2215627141,823,2198255375,2305163769,3565424387,251658250,2197964471,2305164025,2215576131,2779,71743247,1711536515,251937673,704132,1186402048,83460870,105089382,182289423,3071213568,4186114118,1133078021,3229880072,251658250,2198488759,2305165305,2232355395,2723,205960975,2305216393,129502275,956301312,257172604,65924,612139776,1551238732,1680112779,1344556171,874792135,0,941900937,3154374401,40996,615287552,172,695144294,2198914947,20194372,2333131139,255075396,1005612817,1918641220,612142051,608471904,615287096,172,2084173825,2215598116,158,1178384143,2197949581,2218328512,44068,615287552,160,1300007270,260011520,2370190519,2305163788,2365607292,2352546120,44068,258438656,21904567,2089379537,1217200205,613169410,172,3071234166,3506523708,1300007270,55086336,2888076345,1979711488,1018629945,1724973390,5078153,956582029,11281548,578158592,1312601871,17154179,612645329,172,1300007270,252409344,21367991,1284073168,2483224645,44068,610009856,611091244,2232353044,4294966840,405042315,2888084619,3338665984,1582148,251658240,210630063,608471862,610044736,4286090556,956427139,3833991135,2298478599,11281580,1284177920,4119406628,606368907,3280145387,266287361,506502,2651097856,4000628869,2308506763,18097228,608471488,608471816,2550434592,69485705,2686747787,2365587456,76113924,613744420,188,2215624837,2140,337923211,3952684035,610044849,266044736,4294789765,613190655,176,91539845,2305217073,610044688,608471832,264275248,536964,608487168,56,608487168,20,608487168,52,2314612992,2333615196,2301633660,611093491,615811872,184,2520205,10310795,91542149,4280554633,29590486,3966958393,405036171,539247755,4280550537,12067988,1149960192,76097572,613744420,184,606356619,4280550537,12067988,1149960192,3229955108,76089972,613744420,184,337921163,175423621,4280550537,12067988,1149960192,3229956132,4183852047,76152831,613744420,184,4294529513,4294949887,1153957887,14372,1153892352,5156,1153892352,13348,1153892352,10276,1153892352,3289124,854130688,838860799,612139968,2265908812,4294966592,2332473103,10495164,4253614080,1459915110,440,4255246592,1275330559,294330404,4294576105,608472063,3709111584,0,69489801,941905033,4280550537,11805844,1418395648,3347658788,874792073,606356619,69489801,1210340489,4280550537,11805844,1418395648,1149847588,3280549924,673465483,69489801,4280550537,11805844,4286906368,2215625097,2100,2215631749,2092,2215627141,2084,337921163,1144635393,1149841444,2198816804,561,807689355,344835977,4253,2313103616,2367956092,76411002,612141369,2344847656,2301895748,18883676,2344827344,255075420,1881425043,1015937793,610044177,2314942828,2339906684,255337596,1948533907,673479683,610055695,610011764,2311534960,2339382396,258745468,2082751635,941904899,1418319673,2467263524,608438976,2346197372,2200183900,2534346235,265323714,464004,609520384,609499512,608471920,3264417652,539247673,146838287,4135849922,2298478598,2212465146,3498643426,4144163009,65045464,1552668729,1175400484,2315224568,2300585084,2204005594,18883708,874792075,2332119949,3342345340,38916,80150528,159,2567227136,0,2088974196,3338870820,36868,80150528,151,2433009408,0,1963086733,2416232216,0,9897159,3338665984,37124,1401749504,612141827,608471840,610044708,608487188,32,609519872,2314742140,2200183876,3904963816,29393666,1814316169,2298667201,2339382340,2368218180,2089531396,3338744868,673479817,941915275,3355559681,1948548233,740588683,2015642761,1418444849,258353188,258394607,1149489903,251732004,2332167209,259269716,2332169233,259531860,2332169233,2199921748,1413157056,3463605284,1881425035,2082755723,740588681,337927305,1144635905,1635001380,956383885,2336760900,2335450236,3342345308,38660,80150528,147,2433009408,0,80165750,135,2198128384,0,8455367,2365587456,1144586818,494290980,874806411,8848583,2332033024,3342345340,34564,80150528,129,608471808,612141880,612120892,608995632,608471336,608471844,608471348,608471840,3833859912,2298478596,3912246340,4294964856,2888084619,822083584,213323712,210331206,29393731,4051158329,2888084617,3909091328,4294966026,1009009803,1076124811,2214557837,3745055211,93291279,3028877312,42020,615287040,172,337921223,0,606368907,673475723,1988956651,666668288,0,956427139,2337108959,3229982212,1150022260,2357919901,40996,2311061760,2332566596,2334139460,1149868036,1149961252,76354596,604277057,3156514047,2231369728,2172915648,2332033027,16817484,3943965772,3922866611,4294965109,337921163,2753868939,2332033024,11281580,1418395648,210582564,608471808,4290937128,54525951,10495116,479002624,688098192,2311061992,2332566596,2334139460,210341892,608471332,613744388,188,2215624837,796,337921163,2955197579,687865856,2231567336,608471551,2256867092,2332033026,2232951900,4018409435,2298478593,759467463,613714688,160,2888084617,2298478592,2335450180,10495108,479002624,273059192,472138889,1133371273,1003956496,253502556,3325673875,146838287,4018409409,2197815298,11281596,252575744,188806,608996096,264865092,104580,112660224,1711405443,2215576457,896,38188815,1711470979,251806601,258948,1186402048,66683652,71534950,64390159,3071213568,4186113606,1133078020,3112439558,251658243,2198357687,2305164793,2215577667,924,172406543,1711798659,252330889,213125,1186402048,1724745996,3087811465,7,1411673145,16417807,2088960000,1980124196,612107093,608996196,615287632,172,740574407,0,941900937,258397953,3347263855,281117456,740574339,608471809,1997606700,608451568,2346938972,2338333820,2302157892,11281580,4160815104,1478786105,10388495,1284177920,3071218724,3238086204,956416131,11281540,2305163264,2249148988,128,337931403,1178384143,3238128009,1245481318,956385421,11281548,1685454848,1312601871,2305222913,1217219132,613169410,172,3071233654,3909176892,1245481318,956516493,11281548,947257344,1312601871,2305222913,1217219132,613169412,172,3071222390,3229830716,971571461,11281540,2305163264,209078844,1175238415,337921027,1108117862,2888088715,50331648,20194396,2199135356,18359404,4265248015,3677487103,4294495465,2210411007,105653372,4276061967,3071279103,612141830,76113428,112762,1038680064,2315255807,615287790,172,2335575181,2336236628,52962372,10495116,3263234048,1073741823,2341477517,31992067,608471488,608471816,2416216864,2300841097,4278461508,12330132,3229941760,9602063,2223702016,45092,264275200,4294462596,65939967,611617075,612666132,160,337935499,2305214769,787052556,2348810232,2334925948,823403612,213323712,210331206,29393730,4051158329,740588681,337927305,4294256617,609520639,608996128,2344628520,3341034588,33284,80150528,131,2164573952,0,2197930115,3816108792,4293973993,3260415,29032448,3909091328,4294963029,4294967227,4156811775,1150025727,76095524,613744420,184,673465483,4280550537,12067988,1149960192,1340679204,3221225464,48,699,4011321600,2894856191,44068,264253696,1715866807,2202209417,3308847552,2894721399,44068,4269730048,3375497215,3404330545,3103784950,1,2229915529,3103784949,3,2028588937,3103784949,2,1827262345,3103784949,6,1625935753,3103784949,5,1424609161,3103784949,4,1223282569,2315255797,3913032772,4294966035,1722,4080396544,29032447,3909091328,4294964011,1466,4079085824,79364095,3909091328,4294963991,954,4077775104,45809663,3909091328,4294963971,440,3922561280,4294966488,472145035,4294361321,440575,3448307712,4294755305,608472063,612141872,610044716,609520404,2181351220,0,941905035,8520903,3338665984,33028,3229810688,608450817,2312795464,2301371516,3910411356,4294965841,1464,3922561280,4294966392,1208,3922561280,4294966380,952,3922561280,4294966368,696,3922561280,4294966356,807687307,337923209,472145035,2232406661,4294964821,4294345705,3351851519,1320004,2298478592,4210551234,1989017599,666668288,0,2215626041,4294963185,265454950,4293910148,2344813055,10495116,2716401664,2432696303",",")
	static raw64:=strsplit("1447122753,1413567809,1398167381,2834071880,1711276032,1207974275,2303249289,3330885079,265193796,223108,981689856,1568935680,1157627907,2215627141,852,2428160305,4278190081,18359444,2236088320,3314108864,54166543,3375431680,51386,613744384,280,1237353800,2215626633,2095,3367684401,4278190080,18359444,2236088320,3280554432,608471368,277090088,1224736776,1225803661,26250637,961085440,3632876739,1220711183,1225834627,2467284793,1287784896,88660105,200,1103444297,1237357327,2467285817,3221832896,2215625348,2616,3364326729,1224736768,2467284281,3476638146,146838287,495194050,1090519050,252233206,177540,1170688256,0,28918016,1090519040,1991,3091267584,49,247617,3120562176,1,3578039625,4010763776,4010763977,3804317888,210585858,3657518103,838370113,252193039,252725289,286195985,1210650370,1210650400,1091637040,1108414224,1210650384,1210650432,1091637072,1108414240,1210650400,1210650464,1091637104,1108414256,2284392240,128,2424842511,251658240,255869201,255869457,10520617,688848896,45192,1091636992,1108414288,2284392272,192,3498584335,251658240,257966353,257966609,14714921,688848896,61576,1091636992,1108414320,2284392304,256,277358863,251658241,8421649,286195712,32898,2284392192,288,814229775,251658241,9470225,286195712,36994,2284392192,320,1351100687,251658241,10518801,286195712,41090,2284392192,352,1887971599,1090519041,254820749,11567377,286195712,45186,1153911040,197,3342925824,34564,3342925824,33540,561250304,2290468681,1,1090519040,12879815,0,3342925824,50307,0,3103163648,1,186,3326414592,615811396,256,1143227591,0,2223620489,36900,4169746432,3339706499,843064388,3338665984,842277956,1207959552,2303518929,1211638892,3766737143,264780039,3240739143,2311293249,2371626052,2357852225,35876,65585408,2298593411,8922244,3770744832,2314634499,8660100,1183645696,3259240447,2313433413,3632874689,702230853,3221309633,1222543685,1881425033,2314731848,1213736012,2015642761,273124680,608471368,3071231072,4290593039,838860799,2149519341,0,738495809,264276297,1715668151,427081861,3359196262,3313724020,76366081,3230222636,1124382479,1975551334,29372903,29180357,2231369728,1148614125,2202132617,2204500422,251675452,281220,4093722880,2422649579,1155805509,2169036937,43204,1600019200,1096565085,1096696157,826655583,850936265,822083584,4251118034,258408447,17439,1217249329,344801537,3364440072,1393866511,1326725478,145130767,3459842048,144606735,2238054400,970683858,3951064526,611072902,3900903220,2332033028,1212163140,673467531,894733636,266877184,1149879623,1149976612,3896067108,2311406095,2370053188,2370633541,34052,21757952,4160835009,1091144516,2303201419,1129325644,956959885,2256670673,2231369732,479020242,2199024914,3524866813,2201019011,255918786,2302792367,1284196563,2302949412,2223590618,38948,3523299328,613189956,148,613714244,128,610044228,76367976,1149847745,2336770084,613744392,280,264275272,500868,1284196352,2336507940,1281893468,2552530059,1140850688,2485423243,1140850688,2149880971,1207959552,2303000969,3800646680,613714244,128,1208782154,608995660,344803432,1150110803,2499739693,75812,3229960192,608996172,2492154984,32804,1115950848,1207959559,1210336395,692358477,210585864,479022121,277563401,1107594574,436505930,1103575372,1220645647,1612989499,3230863169,264308805,393348,218006272,100107791,1821048832,3984940068,82674703,256114688,4253222839,2302961153,3364097792,1140850694,38778639,21073228,1258487171,1711277197,1108117830,113345551,256114688,2198095799,1147536381,33703049,111379471,256114688,2198226871,1147536637,67257481,107119631,256114688,2198357943,1147536893,100811913,105153551,256114688,2198489015,1147537405,134366345,105153807,256114688,1712080823,38046020,505866,2336489472,9446532,960757760,257696836,59524,612139776,1316357720,608996172,3224454512,422350155,610044748,3375449464,1725235528,74387267,3246604547,286212609,1224738116,1141948547,2284096569,1996488704,2626372834,33828,3623961600,614218564,140,9667599,2302738432,29393856,213323590,3355527495,1181140537,1984040073,3230220668,213323590,3355527495,210323046,1082999874,3325641729,256271222,1229393079,1181140993,1145179273,1140998285,1299629625,213323590,3355527495,210323046,1082999874,4030284035,256259955,1229393079,1181140993,1145179273,1141129357,561432121,213323590,96502599,969408841,2303092422,225853964,79105860,3355527239,76104806,1149978690,21319716,268518612,4294804289,4232283151,2303066111,1821068531,2336503844,16786612,2235891712,3179548662,2332033026,17835180,3984916480,81036559,826605568,3682944448,265914693,312708,3263775744,778485809,8658703,0,347541316,3229829191,2211547393,3325624770,344540262,1105819467,2202136577,3514106345,3736014660,1171818820,2303253297,3221309637,1076133003,611617604,32473924,32408385,267860292,255875,3968418048,610044228,3958737208,29852428,267860292,245635,1173915904,1216814219,8721549,1157627904,3782531973,611617608,3590408232,3310652233,3767092224,1208388420,1296239757,2499788801,75812,3229960192,69305359,54788096,2343758630,1162093636,2337076105,1144530028,2405515,2231369729,193269696,1157627903,270840971,1157627905,125105797,1726230853,1159956804,1150016649,3229955108,61834255,3343384576,3679300,1157627904,3979474481,874804363,616336200,288,2422659889,3712781129,3380955136,3623813748,29590344,3967278649,4293495116,18883732,2336751616,4280820812,18883732,2303459328,613744633,288,1961723208,3918088202,539268351,1291845633,175437445,4294019404,18883732,2336751616,1211638852,2215624837,4294966019,4290873672,18883732,4108910592,1107296250,4294967228,1153911039,14372,826605568,1223504374,673465543,0,874792135,50,4294924265,1284196607,2370320420,2303246596,1212687428,3941138571,1157627899,2968717,608996168,344803896,205,2357806080,32804,1284066304,2499758116,71716,1284197376,2303477796,1149847801,2370725924,36124,2303459328,1552501978,2499760164,71716,1552632832,2303217700,1212687428,673467531,4292512076,18359444,2337013760,1281893460,1210338443,265454925,196740,3380956416,49775631,2236088320,4001632192,2332033026,1144267852,2149876875,1140850688,3398025529,3515425139,1090634371,3343503417,51716,3342925824,35076,80150528,136,2346677504,960504916,1295262804,2303250313,1277699140,941905033,40010767,2302935040,3912508484,4294965815,1143237771,611617604,32342848,32408385,267729220,180102,3375449344,616335688,248,610044228,4152968248,1157007681,132894345,956427651,2304669437,210453992,613239943,133,3380954368,55371380,1227367524,12932235,2370367625,2336572172,21832708,613744576,296,264275272,113284,872628480,834267940,612139968,2265908824,4294966188,1711781647,3091858569,1,4294705385,1156680191,941907083,1106676036,2336816777,16262332,2303262720,3372304585,608471880,3640739880,610044228,1284064320,2336962596,1090581844,4294967228,747457279,1166754992,4029235456,4290773325,19408020,2236088320,1468272576,1157627901,941902987,612666180,272,610044740,4046012736,5047108,264275269,58501,3682944256,2302945908,264253898,17439,79105860,3229829191,2211547393,3325624770,76104806,1105819467,2202136833,3597992427,3924046149,4294966526,609520456,2428514600,1162135369,0,80167168,7,33867520,0,79725384,13122888,3698655232,4294395113,265433599,1716980919,1213205641,956416643,3924850646,4294966149,610044740,3767092280,2303258249,3221309637,612141896,1552499752,2370320420,2336949004,1090581844,4294967228,1015892735,126567607,1307584833,2499788801,75812,3229960192,4235232271,2336555007,17835156,2336489472,1161307228,2215629445,4294966359,1105824065,54849833,1724461327,1259112770,4294722281,3918089471,539268351,1207959553,673467531,539268351,1275068417,2499803529,73764,4155369728,3224502271,1911156017,1107296251,4294967228,4228704767,96010239,3909091328,4294965718,1208,4190955776,112787455,3909091328,4294965698,608471364,1149846592,3504944164,3103784951,1,4294552041,243967,2682847232,3103784953,2,4294546921,3934864895,611093324,3565765944,4294685161,609520639,3582544948,1240107333,2337064585,1161307244,2303513737,2235049036,2844069842,3925868539,4294966216,4202255,2215626297,4294964971,265454950,4294367876,3922002431,4294964904,826657073,4258458057,2425421823,2425393296,2425393296,2425393296",",")
	; Functions:
	static pr:=DllCall("Kernel32.dll\GetProcAddress", "Ptr", DllCall("Kernel32.dll\GetModuleHandle", "Str", "MSVCRT.dll", "Ptr"), "AStr", "realloc", "Ptr")
	static fr:=DllCall("Kernel32.dll\GetProcAddress", "Ptr", DllCall("Kernel32.dll\GetModuleHandle", "Str", "MSVCRT.dll", "Ptr"), "AStr", "free", "Ptr")
	static cpy:=DllCall("Kernel32.dll\GetProcAddress", "Ptr", DllCall("Kernel32.dll\GetModuleHandle", "Str", "MSVCRT.dll", "Ptr"), "AStr", "memcpy", "Ptr")
	static bin:=sort_len("","","","",true) ; init.
	if init {
		if !(pr*fr*cpy)
			throw exception("Failed to retrieve function pointers: " pr "`t" fr "`t" cpt ".")
		bin:=DllCall("Kernel32.dll\VirtualAlloc", "Uptr",0, "Ptr", (raw:=A_PtrSize==4?raw32:raw64).length()*4, "Uint", flAllocationType, "Uint", flProtect, "Ptr")
		for k, i in raw
			NumPut(i,bin+(k-1)*4,"Int")
		raw32:="",raw64:=""
		return bin
	}
	;return DllCall(bin, "ptr", &str, "ptr", &del, "int", shortFirst, "uint", strlen(del), "ptr", pr,"ptr", fr,"ptr", cpy, "ptr", registercallback("mb", "f cdecl"), "cdecl") ; db
	r:=DllCall(bin, "ptr", &str, "ptr", &del, "int", shortFirst, "uint", strlen(del), "int", omitEmpty, "ptr", pr,"ptr", fr,"ptr", cpy, "cdecl")
	if omitEmpty && r
		varsetcapacity(str, -1)
	return r != -1 ; 0 on fail, 1 on success
}
