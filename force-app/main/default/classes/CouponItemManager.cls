@RestResource(urlMapping='/cpitem/*')
global with sharing class CouponItemManager {
    
    @HttpGet
    global static Coupon_Item__c getCouponItemById() {
        RestRequest request = RestContext.request;
        
        String cpItemId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        Coupon_Item__c result = [Select Name, RecordTypeId, Coupon_Item_Name__c, Description__c, Face_Value__c, Minimum_Redeem_Balance__c, Offer_Code__c, Redeem_Status__c From Coupon_Item__c where Name=:cpItemId];
        
        return result;
    }
    /**
    @HttpPost
    global static String createCpItem(Integer valid_length, String current_date, String cptype) {
        Date new_date = Date.parse(current_date);
        Coupon_Item__c newcp = new Coupon_Item__c(Create_Date__c=new_date, Valid_Length__c=valid_length, Coupon_Type__c=cptype);
        
        insert newcp;
        return 'Record created';
    }
    @HttpPut
    global static String updateCpItem(String cpItemId, String status){
        Coupon_Item__c thisCp = [Select Status__c From Coupon_Item__c where Name=:cpItemId];
        thisCp.Status__c = status;
        update thisCp;
        return 'Record updated';
    } **/
}