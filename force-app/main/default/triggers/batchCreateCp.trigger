trigger batchCreateCp on cpCoupon_batch__c (after insert) {
    System.debug('Inside Trigger');
    List<cpCoupon_single__c> insert_list = new List <cpCoupon_single__c>();
    
    for(cpCoupon_batch__c cpCoupon_batch : Trigger.New) {
        if(cpCoupon_batch.quantity__c > 0) {
            System.debug('Passed quantity check');
            for (Integer i=0; i<cpCoupon_batch.quantity__c; i++) {
                cpCoupon_single__c cp = new cpCoupon_single__c(
                    Coupon_Item_ID__c = cpCoupon_batch.Coupon_Item_ID__c,
                    status__c='VALID',
                    Created_As__c='BATCH'
                );
                System.debug('Passed create coupon single');
                insert_list.add(cp);
            }
        }
    }
    
    try {
		insert insert_list;
         System.debug('list inserted, size: '+insert_list.size());
	} catch (system.Dmlexception e) {
		System.debug(e);
	}
}