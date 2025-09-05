sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"mslreport/test/integration/pages/MslreportList",
	"mslreport/test/integration/pages/MslreportObjectPage"
], function (JourneyRunner, MslreportList, MslreportObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('mslreport') + '/index.html',
        pages: {
			onTheMslreportList: MslreportList,
			onTheMslreportObjectPage: MslreportObjectPage
        },
        async: true
    });

    return runner;
});

