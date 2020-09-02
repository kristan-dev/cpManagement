@RestResource(urlMapping='/cp/*')
global with sharing class SerializedCouponManager {
    /** @HttpGet
    global static cpCoupon_single__c getCouponById() {
        RestRequest request = RestContext.request;
        String cpId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        cpCoupon_single__c result = [Select Coupon_Item_ID__c, Name, Status__c From cpCoupon_single__c where Name=:cpId];
        
        return result;
    }**/
    
    /**@HttpPost
    global static String createCp(String cpItemId, String status) {
        Coupon_Item__c thisCpItem = [Select Name From Coupon_Item__c where Name=:cpItemId];
        cpCoupon_single__c newcp = new cpCoupon_single__c(Coupon_Item_ID__c=thisCpItem.Name, status__c=status, Created_As__c='SINGLE API');
        insert newcp;
        return 'Record created';
    }**/
}