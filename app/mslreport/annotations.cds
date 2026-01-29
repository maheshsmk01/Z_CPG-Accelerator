using zcpgmslreport as service from '../../srv/service';
annotate service.Mslreport with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Material',
                Value : Material,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Product Description',
                Value : ProductDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Material Warehouse Stock Qty',
                Value : MatlWrhsStkQtyInMatlBaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Base Unit',
                Value : BaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Criticality',
                Value : Criticality,
                Criticality : Criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>RemainingDays}',
                Value : Remaining_days,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Remarks',
                Value : Due_range,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Manufacture Date',
                Value : ManufactureDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ShelfLife Expiration Date',
                Value : ShelfLifeExpirationDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Plant',
                Value : Plant,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Plant Name',
                Value : PlantName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Storage Location',
                Value : StorageLocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Storage Location Name',
                Value : StorageLocationName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Batch',
                Value : Batch,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier',
                Value : Supplier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier Name',
                Value : SupplierName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Batch By Supplier',
                Value : BatchBySupplier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Material Batch In RstrcdUseStock',
                Value : MatlBatchIsInRstrcdUseStock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Batch Status',
                Value : BatchStatus,
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
            Label : '{i18n>Material}',
            Value : Material,
        },
        {
            $Type : 'UI.DataField',
            Value : ProductDescription,
            Label : '{i18n>Product Description}',
        },
        {
            $Type : 'UI.DataField',
            Value : MatlWrhsStkQtyInMatlBaseUnit,
            Label : '{i18n>MaterialBaseunit}',
        },
        {
            $Type : 'UI.DataField',
            Value : BaseUnit,
            Label : '{i18n>BaseUnit}',
        },
        {
            $Type : 'UI.DataField',
            Value : Criticality,
            Label : '{i18n>Criticality}',
            Criticality : Criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : Due_range,
            Label : '{i18n>Remarks}',
        },
        {
            $Type : 'UI.DataField',
            Value : Remaining_days,
            Label : '{i18n>RemainingDays}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Batch}',
            Value : Batch,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Supplier}',
            Value : Supplier,
        },
        {
            $Type : 'UI.DataField',
            Value : SupplierName,
            Label : '{i18n>SupplierName}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>StorageLocation}',
            Value : StorageLocation,
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocationName,
            Label : '{i18n>StorageLocationName}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Plant}',
            Value : Plant,
        },
        {
            $Type : 'UI.DataField',
            Value : PlantName,
            Label : '{i18n>PlantName}',
        },
        {
            $Type : 'UI.DataField',
            Value : BatchStatus,
            Label : '{i18n>BatchStatus}',
        },
        {
            $Type : 'UI.DataField',
            Value : ManufactureDate,
            Label : '{i18n>ManufactureDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : ShelfLifeExpirationDate,
            Label : '{i18n>ShelflifeExpirationDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : BatchBySupplier,
            Label : '{i18n>BatchBySupplier}',
        },
        {
            $Type : 'UI.DataField',
            Value : MatlBatchIsInRstrcdUseStock,
            Label : '{i18n>RstrcdUseStock}',
        },
    ],
    UI.SelectionFields : [
        Criticality,
        Due_range,
        Remaining_days,
    ],
);

annotate service.Mslreport with {
    Criticality @(
        Common.Label : '{i18n>Criticality}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZZCriticalityF4',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Criticality,
                    ValueListProperty : 'Criticality',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Due_range',
                },
            ],
            Label : '{i18n>Criticality}',
        },
        Common.ValueListWithFixedValues : false,
        )
};

annotate service.Mslreport with {
    Due_range @(
        Common.Label : '{i18n>Remarks}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZZDuerangeF4',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Due_range,
                    ValueListProperty : 'Due_range',
                    
                },
            ],
            Label : '{i18n>Remarks}',
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Mslreport with {
    Remaining_days @(
        Common.Label : '{i18n>Remaining Days}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZZRemainingdaysF4',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Remaining_days,
                    ValueListProperty : 'Remaining_days',
                },
            ],
            Label : '{i18n>Remaining Days}',
            PresentationVariantQualifier : 'vh_Mslreport_Remaining_days',
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.ZZRemainingdaysF4 with @(
    UI.PresentationVariant #vh_Mslreport_Remaining_days : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : Remaining_days,
                Descending : false,
            },
        ],
    }
);

