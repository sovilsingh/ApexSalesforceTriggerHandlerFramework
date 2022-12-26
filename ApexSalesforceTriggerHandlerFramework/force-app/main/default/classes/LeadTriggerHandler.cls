public class LeadTriggerHandler extends TriggerHandler {

    @testVisible static ILeadTriggerHandlerDOA accountDoaInstance = new LeadTriggerHandlerDOA();

    public LeadTriggerHandler(){
        //constructor
        //this.setMaxLoopCount(1);
        
    }
    
    public override void beforeInsert() {
        				
    }
    public override void beforeUpdate() {
        				
    }
    public override void beforeDelete() {
        				
    }
    public override void afterInsert() {
        List<Account> accList = new List<Account>();
         for(Lead ld : (List<Lead>)Trigger.New)
         {
             Account acc = new Account();
             acc.Name = ld.Name;
             accList.add(acc);
         }
        //TriggerHandler.bypass('AccountTriggerHandler');
        //insert accList;
        accountDoaInstance.CreateAccountFromLead(accList);
        //TriggerHandler.clearBypass('AccountTriggerHandler');
        
        				
    }
    public override void afterUpdate() {
        				
    }
    public override void afterDelete() {
        				
    }
    public override void afterUndelete() {
        				
    }

}