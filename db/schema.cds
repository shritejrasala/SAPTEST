namespace com.satInfoTech.ElectronicsApp;

using { managed, cuid } from '@sap/cds/common';

entity BusinessPartner : cuid, managed {
    @title:'BusinessPartnerId'
    BusinessPartnerID  : String(10);
    @title:'Name'
    name        : String(20);
    @title:'Address1'
    address1    : String(30);
    @title:'Address2'
    address2    : String(30);
    @title:'PinCode'
    pincode     : String(10);
     @title:'State'
     state:String(2);
     @title:'is_vendor'
     is_vendor:Boolean default false;
     is_customer:Boolean default false;
}
entity Store : cuid, managed {
    @title:'StoreId'
    storeid:String(10);
    @title:'Name'
    Name:String(20);
     @title:'Address1'
    address1    : String(30);
    @title:'Address2'
    address2    : String(30);
    @title:'City'
    city:String(20);
     @title:'PinCode'
    pincode     : String(10);
     @title:'State'
     state:String(2);
}
@cds.persistence.skip
entity State {
    @title : 'code'
    key code:  String(10);
    @title : 'description'
    description: String(30);
}
entity Product : cuid, managed{
    @title:'ProductId'
    productid:String(10);
    @title:'product Name'
    productname:String(20);
    @title:'product image'
    productimage:String   @mandatory;
    @title:'product cost price'
    productcostprice:Decimal(10,2);
    @title:'product selling price'
    productsellingprice:Decimal(10,2);
}
entity StockData : cuid, managed {
    @title:'Store id'
     store  : Association to Store;
     @title:'Product id'
  product : Association to Product;
  @title:'stock qty'
  stockQty : Integer;
} 
entity PurchaseOrder : cuid, managed {
    @title:'Purchase Order Number'
    purchaseOrderNumber : Integer;
    @title:'Purchase Order Date'
    purchaseOrderDate : Date;
    @title:'Business Partner'
    businessPartner : Association to BusinessPartner;
    @title:'Items'
    items: Composition of many {
        @title:'Product ID'
        product_id : Association to Product;
        @title:'Quantity'
        qty : Integer;
        @title:'Price'
        price : Decimal(10,2);
        @title:'Store ID'
        store_id : String(10);
    };
}
entity Sale : cuid, managed {
    @title:'sale Order Number'
    saleOrderNumber : Integer;
    @title:'sale Order Date'
    saleDate : Date;
    @title:'Business Partner'
    businessPartner : Association to BusinessPartner;
    @title:'Items'
    items: Composition of many {
        @title:'Product ID'
        product_id : String(10);
        @title:'Quantity'
        qty : Integer;
        @title:'Price'
        price : Decimal(10,2);
        @title:'Store ID'
        store_id : String(10);
    };
}