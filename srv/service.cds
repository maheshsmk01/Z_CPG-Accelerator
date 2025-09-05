using zcpgacce from '../db/Scheme';

service zcpgservice {
@odata.draft.enabled    //with this create enables
entity Configtable as projection on zcpgacce.ZCONFIG;
}

service zcpgmslreport {
//@odata.draft.enabled    //with this create enables
entity Mslreport as projection on zcpgacce.DueMaterialList;
entity ZZRemainingdaysF4 as projection on zcpgacce.ZRemainingdaysF4;
entity ZZDuerangeF4 as projection on zcpgacce.ZDuerangeF4;
entity ZZCriticalityF4 as projection on zcpgacce.ZCriticalityF4;

}