namespace zcpgacce;

entity ZCONFIG {
  key criticality : String(1);
   daysfrom        : Int16;
   daysto          : Int16;
      remarks         : String(22);
}
entity DueMaterialList {
  key Material         : String(40);         // ZYCDS_DUE_MAT_LIST.Material
  key Plant            : String(4);         // ZYCDS_DUE_MAT_LIST.Plant
  key StorageLocation  : String(4);         // ZYCDS_DUE_MAT_LIST.StorageLocation
  key Batch            : String(10);         // ZYCDS_DUE_MAT_LIST.Batch
  key Supplier         : String(10);         // ZYCDS_DUE_MAT_LIST.Supplier

  ProductDescription   : String(55);         // ZYCDS_DUE_MAT_LIST.ProductDescription
  PlantName            : String(25);         // ZYCDS_DUE_MAT_LIST.PlantName
  StorageLocationName  : String(65);         // I_StorageLocation.StorageLocationName
  BatchBySupplier      : String(10);         // ZYCDS_DUE_MAT_LIST.BatchBySupplier
  SupplierName         : String(65);         // ZYCDS_DUE_MAT_LIST.SupplierName

  BaseUnit             : String(4);         // ZYCDS_DUE_MAT_LIST.BaseUnit

//  @Semantics.quantity.unitOfMeasure : 'BaseUnit'
  MatlWrhsStkQtyInMatlBaseUnit : Decimal(15,3);

  MatlBatchIsInRstrcdUseStock : Boolean;
  ShelfLifeExpirationDate     : Date;
  ManufactureDate             : Date;
  BatchStatus                 : String(25);

  Remaining_days : Int16;

  Criticality : Int16;  // _Config.criticality
  Due_range   : String(16);   // _Config.remarks
}

entity ZRemainingdaysF4 {
  key Remaining_days : Int16;
  
}
entity ZDuerangeF4 { 
  key  Due_range   : String(16);  
  
}
entity ZCriticalityF4 {
  key  Criticality : Int16;   
       Due_range   : String(16);
}


