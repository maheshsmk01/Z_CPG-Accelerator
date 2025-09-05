using zcpgservice as service from '../../srv/service';
annotate service.Configtable with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'daysfrom',
                Value : daysfrom,
            },
            {
                $Type : 'UI.DataField',
                Label : 'daysto',
                Value : daysto,
            },
            {
                $Type : 'UI.DataField',
                Label : 'remarks',
                Value : remarks,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Criticality}',
            Value : criticality,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DaysFrom}',
            Value : daysfrom,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DaysTo}',
            Value : daysto,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Remarks}',
            Value : remarks,
        },
    ],
);

annotate service.Configtable with {
    criticality @(
        Common.FieldControl : #ReadOnly,
        )
};

annotate service.Configtable with {
    daysfrom @Common.FieldControl : #Mandatory
};

annotate service.Configtable with {
    daysto @Common.FieldControl : #Mandatory
};

annotate service.Configtable with {
    remarks @Common.FieldControl : #Mandatory
};

annotate service.Configtable with {
    criticality @Common.ExternalID : criticality
};

