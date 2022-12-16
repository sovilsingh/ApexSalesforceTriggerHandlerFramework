public class LeadTriggerHandler extends TriggerHandler {
    
    List<Lead> newLeads;

    public LeadTriggerHandler(){
        //constructor
        //this.setMaxLoopCount(1);
        
    }
    
    public override void beforeInsert() {
        system.debug('leadTriggerHandler : beforeInsert');
        System.debug('beforeInsert Leadnew'+ Trigger.new);
        				
    }
    public override void beforeUpdate() {
        				
    }
    public override void beforeDelete() {
        				
    }
    public override void afterInsert() {
        system.debug('leadTriggerHandler afterinsert running');
        System.debug('afterInsert Leadnew'+ Trigger.new);
        List<Account> accList = new List<Account>();
         for(Lead ld : (List<Lead>)Trigger.New)
         {
             Account acc = new Account();
             acc.Name = ld.Name;
             accList.add(acc);
         }
        //TriggerHandler.bypass('AccountTriggerHandler');
        insert accList;
        //TriggerHandler.clearBypass('AccountTriggerHandler');
        system.debug('account'+accList);
        
        				
    }
    public override void afterUpdate() {
        				
    }
    public override void afterDelete() {
        				
    }
    public override void afterUndelete() {
        				
    }

}