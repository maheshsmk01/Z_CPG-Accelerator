const cds = require("@sap/cds");

// Service implementation
module.exports = cds.service.impl(async function () { 
   const db = await cds.connect.to("db");
    const Mslreport_Cloud_API = await cds.connect.to("mslreport");



this.on("READ", 'ZZDuerangeF4', async (req) => {
  await db.run(DELETE.from('ZCPGACCE.ZDUERANGEF4'));
let Confiftabledataf4 =  await db.run(SELECT.from('ZCPGACCE_ZCONFIG').columns('REMARKS'));
 for(const ZConfiftabledataf4 of Confiftabledataf4){
console.log("Df4:", ZConfiftabledataf4 )

        await db.run(INSERT.into('ZCPGACCE.ZDUERANGEF4').entries( {Due_range: ZConfiftabledataf4.REMARKS }     
  ));   
}
return await db.run(req.query); // return should be always written outside loop
});

this.on("READ", 'ZZCriticalityF4', async (req) => {
   await db.run(DELETE.from('ZCPGACCE.ZCRITICALITYF4'));
let Confiftabledata2f4 =  await db.run(SELECT.from('ZCPGACCE_ZCONFIG').columns('CRITICALITY','DAYSFROM','DAYSTO','REMARKS'));
for(const ZConfiftabledata2f4 of Confiftabledata2f4){  // looping records  using 'for' to insert into enity
console.log("cf4:", ZConfiftabledata2f4 )

        await db.run(INSERT.into('ZCPGACCE.ZCRITICALITYF4').entries( {Criticality: ZConfiftabledata2f4.CRITICALITY, Due_range: ZConfiftabledata2f4.REMARKS }     
  ));
}
  return await db.run(req.query);   // return should be always written outside loop

});


this.on("READ", 'ZZRemainingdaysF4', async (req) => {
  await db.run(DELETE.from('ZCPGACCE.ZREMAININGDAYSF4'));
  const MSLDataF4 = await Mslreport_Cloud_API.run(SELECT.from("MAtDueList2").columns("Remaining_days"));
 
// 3. Deduplicate & remove null/undefined  using Set
  const UZMSLDataF4 = [...new Set(MSLDataF4.map(r => r.Remaining_days).filter(day => day !== null && day !== undefined))];
 
 console.log("RF4:", UZMSLDataF4 );

 // 4. Insert only valid unique values
  if (UZMSLDataF4.length > 0) {
    const entries = UZMSLDataF4.map(day => ({ Remaining_days: day }));
   
    console.log("ERF4:", entries);
    await db.run(INSERT.into('ZCPGACCE.ZREMAININGDAYSF4').entries(entries));
  }
 return await db.run(req.query);   // return should be always written outside loop

});

this.on("READ", 'Mslreport', async (req) => {
await db.run(DELETE.from('ZCPGACCE.DUEMATERIALLIST'));
const MSLData = await Mslreport_Cloud_API.run(SELECT.from("MAtDueList2").columns("Material",
      "Plant",
      "StorageLocation",
      "Batch",
      "Supplier",
      "ProductDescription",
      "PlantName",
      "StorageLocationName",
      "BatchBySupplier",
      "SupplierName",
      "BaseUnit",
      "MatlWrhsStkQtyInMatlBaseUnit",
      "MatlBatchIsInRstrcdUseStock",
      "ShelfLifeExpirationDate",
      "ManufactureDate",
      "BatchStatus",
      "Remaining_days",
      "Criticality",
      "Due_range"
      ));
console.log(MSLData);

let Confiftabledata =  await db.run(SELECT.from('ZCPGACCE_ZCONFIG').columns('CRITICALITY','DAYSFROM','DAYSTO','REMARKS'));
let var1, var2;
if(MSLData && MSLData.length > 0){
  
  for (const Msl of MSLData) {
    // Check if Remaining_days falls into any config range
 const matchedConfig = Confiftabledata.find(cfg => 
   Msl.Remaining_days >= cfg.DAYSFROM && Msl.Remaining_days <= cfg.DAYSTO
   
 );
  if (matchedConfig) {

     var1 = matchedConfig.CRITICALITY;
     var2 = matchedConfig.REMARKS;

  
        await db.run(INSERT.into('ZCPGACCE.DUEMATERIALLIST').entries( { Material: Msl.Material,
      Plant: Msl.Plant,
      StorageLocation: Msl.StorageLocation,
      Batch: Msl.Batch,
      Supplier: Msl.Supplier,
      ProductDescription: Msl.ProductDescription,
      PlantName: Msl.PlantName,
      StorageLocationName: Msl.StorageLocationName,
      BatchBySupplier: Msl.BatchBySupplier,
      SupplierName: Msl.SupplierName,
      BaseUnit: Msl.BaseUnit,
      MatlWrhsStkQtyInMatlBaseUnit: Msl.MatlWrhsStkQtyInMatlBaseUnit,
      MatlBatchIsInRstrcdUseStock: Msl.MatlBatchIsInRstrcdUseStock,
      ShelfLifeExpirationDate: Msl.ShelfLifeExpirationDate,
      ManufactureDate: Msl.ManufactureDate,
      BatchStatus: Msl.BatchStatus,
      Remaining_days: Msl.Remaining_days,
      Criticality: var1,
      Due_range: var2 }
 
  ));
              //  return await db.run(req.query);
          
  }else{

    // Msl.Criticality = 0;
    // Msl.REMARKS      = '';
  
    //             await db.run(INSERT.into('ZCPGACCE.DUEMATERIALLIST').entries(Msl));
    //           // return await db.run(req.query);

       var1 = 0;
       var2 = '';

        await db.run(INSERT.into('ZCPGACCE.DUEMATERIALLIST').entries( { Material: Msl.Material,
      Plant: Msl.Plant,
      StorageLocation: Msl.StorageLocation,
      Batch: Msl.Batch,
      Supplier: Msl.Supplier,
      ProductDescription: Msl.ProductDescription,
      PlantName: Msl.PlantName,
      StorageLocationName: Msl.StorageLocationName,
      BatchBySupplier: Msl.BatchBySupplier,
      SupplierName: Msl.SupplierName,
      BaseUnit: Msl.BaseUnit,
      MatlWrhsStkQtyInMatlBaseUnit: Msl.MatlWrhsStkQtyInMatlBaseUnit,
      MatlBatchIsInRstrcdUseStock: Msl.MatlBatchIsInRstrcdUseStock,
      ShelfLifeExpirationDate: Msl.ShelfLifeExpirationDate,
      ManufactureDate: Msl.ManufactureDate,
      BatchStatus: Msl.BatchStatus,
      Remaining_days: Msl.Remaining_days,
      Criticality: var1,
      Due_range: var2 }
 
  ));            
        
  }

  }
} ;
return await db.run(req.query);
});


this.before(['CREATE', 'UPDATE'], 'Configtable.drafts', async(req) => {
  const{daysfrom, daysto} = req.data;
  const daysfromc = daysfrom;
  const allowed = ['1', '2', '3'];// restricting table entry to only 3
    if (req.data.criticality && !allowed.includes(req.data.criticality.toString())) {
      req.error(400, `Invalid criticality value '${req.data.criticality}'. Allowed values are 1, 2, or 3.`);
    }

    if (daysfrom || !daysfrom ){
      
      let Confifdata =  await db.run(SELECT.from('ZCPGACCE_ZCONFIG').columns('DAYSFROM','DAYSTO').where({ CRITICALITY: { '!=': req.data.criticality } }));
     
      let Confifdatadraft =  await db.run(SELECT.one.from('ZCPGSERVICE_CONFIGTABLE_DRAFTS').columns('DAYSFROM','DAYSTO').where({ CRITICALITY:  req.data.criticality  }));
      console.log(Confifdatadraft);
      console.log(Confifdata);
      for (let i = 0; i < Confifdata.length; i++) {
        const daysto2 = Confifdata[i].DAYSTO;
        const dayfrom2 = Confifdata[i].DAYSFROM;
        console.log(req.data);
        
   
        if (daysfrom <= daysto2 && Confifdatadraft.DAYSTO >= dayfrom2){
         req.error(400, `Overlapping ranges not allowed for'${req.data.criticality}'`);
       }
   
       if(daysto >= dayfrom2  && daysto <= daysto2){
         req.error(400, `Overlapping ranges not allowed for'${req.data.criticality}'`);
       }
     
      };
      
    }
}
)



})