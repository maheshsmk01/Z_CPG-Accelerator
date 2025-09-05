sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'configtable/test/integration/FirstJourney',
		'configtable/test/integration/pages/ConfigtableList',
		'configtable/test/integration/pages/ConfigtableObjectPage'
    ],
    function(JourneyRunner, opaJourney, ConfigtableList, ConfigtableObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('configtable') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheConfigtableList: ConfigtableList,
					onTheConfigtableObjectPage: ConfigtableObjectPage
                }
            },
            opaJourney.run
        );
    }
);