@RestResource(urlMapping='/cpitem/cash/*')
global with sharing class CouponItemManager {
    
    @HttpGet
    global static Coupon_Item__c getCouponItemById() {
        RestRequest request = RestContext.request;
        
        String cpItemId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        Coupon_Item__c result = [Select Name, RecordTypeId, Coupon_Item_Name__c, Description__c, Face_Value__c, Minimum_Redeem_Balance__c, Offer_Code__c, Redeem_Status__c, Validate_Status__c From Coupon_Item__c where Name=:cpItemId];
        
        return result;
    }
    
    @HttpPost
    global static Coupon_Item__c createCashCpItem(
        String cp_Coupon_Image, 
        String cp_Coupon_Item_Name, 
        String cp_Description, 
        Decimal cp_Face_Value, 
        Decimal cp_Minimum_Redeem_Balance, 
        String cp_Offer_Code, 
        Integer cp_Quota, 
        Boolean cp_Redeem_Once_Only, 
        String cp_Redeem_Status,
        Boolean cp_Update_Coupon_Status_on_Redemption,
        Boolean cp_Update_Customer_Id_on_Coupon_Creation,
        Boolean cp_Update_Valid_From_on_Coupon_Creation,
        Boolean cp_Validate_Customer,
        Boolean cp_Validate_Date,
        Boolean cp_Validate_Status,
        Integer cp_Valid_From_Offset_in_days,
        Integer cp_Valid_Length_in_days
        ) {
        Coupon_Item__c newcp = new Coupon_Item__c(
            Coupon_Image__c = cp_Coupon_Image,
            Coupon_Item_Name__c = cp_Coupon_Item_Name,
            Description__c = cp_Description,
            Face_Value__c = cp_Face_Value,
            Minimum_Redeem_Balance__c = cp_Minimum_Redeem_Balance,
            Offer_Code__c = cp_Offer_Code,
            Quota__c = cp_Quota,
            Redeem_Once_Only__c = cp_Redeem_Once_Only,
            Redeem_Status__c = cp_Redeem_Status,
            Update_Coupon_Status_on_Redemption__c = cp_Update_Coupon_Status_on_Redemption,
            Update_Customer_Id_on_Coupon_Creation__c = cp_Update_Customer_Id_on_Coupon_Creation,
            Update_Valid_From_on_Coupon_Creation__c = cp_Update_Valid_From_on_Coupon_Creation,
            Validate_Customer__c = cp_Validate_Customer,
            Validate_Date__c = cp_Validate_Date, 
            Validate_Status__c = cp_Validate_Status,
            Valid_From_Offset_in_days__c = cp_Valid_From_Offset_in_days,
            Valid_Length_in_days__c = cp_Valid_Length_in_days
        );
        
        insert newcp;
        return newcp;
    }

    @HttpPut
    global static String updateCashCpItem(String cp_itemid, String cp_status){
        Coupon_Item__c thisCp = [Select Redeem_Status__c From Coupon_Item__c where Name=:cp_itemid];
        thisCp.Redeem_Status__c = cp_status;
        update thisCp;
        return 'Record updated';
    }
}