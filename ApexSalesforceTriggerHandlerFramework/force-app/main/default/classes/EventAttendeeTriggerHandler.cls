public class EventAttendeeTriggerHandler 
{
    public Static void sendConfirmationEmail(List<Event_Attendee__c> newrecordsList )
    {
        Set<Id> attendeesIdsSet = new Set<Id>();
        Set<Id> eventIdsSet = new Set<Id>();
        
        for(Event_Attendee__c ea : newrecordsList)
        {
            attendeesIdsSet.add(ea.Attendee__c);
            eventIdsSet.add(ea.Event__c);
        }
        
        //List<Attendee__c> attendeeList = [Select ID, Name, Email__c From 
         //                                 Attendee__c Where ID IN : attendeesIdsSet];
        Map<ID, Attendee__c> attendeeMap = New Map<Id,Attendee__c>(
                                           [Select ID, Name, Email__c From 
                                           Attendee__c Where ID IN : attendeesIdsSet]);
        
       // List<Event__c> eventList = [Select ID, Start_DateTime__c, Event_Organizer__c, Event_Organizer__r.Name, 
          //                          Location__c, 
         //                           Location__r.Name, 
         //                           Location__r.City__c, 
         //                           Location__r.State__c,
        //                            Location__r.Country__c,
        //                            Location__r.Postal_Code__c,
        //                            Location__r.Street__c
        //                            From Event__c Where ID IN : eventIdsSet];
        
        
        Map<Id,Event__c> eventMap = new Map<Id,Event__c>(
                                    [Select ID, Start_DateTime__c, Event_Organizer__c, Event_Organizer__r.Name,
                                    Location__c,Location__r.Name, 
                                    Location__r.City__c,Location__r.State__c,
                                    Location__r.Country__c,Location__r.Postal_Code__c,
                                    Location__r.Street__c
                                    From Event__c Where ID IN : eventIdsSet]);
        
        
        for(Event_Attendee__c ea : newrecordsList)
        {
            Attendee__c att = attendeeMap.get(ea.Attendee__c);
            Event__c evt =  eventMap.get(ea.Event__c);
        
        
        /* Prepare Email Template */
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        /*
         * To, cc , Bcc
         * Subject
         * Body
         * Signature
         * Attachment
         */
         
          mail.setSubject('Pass for the '+evt.Name__c);
          List<String> toAddress = new List<String>();
          toAddress.add(att.Email__c);
          mail.setToAddresses(toAddress);
          mail.setSenderDisplayName(evt.Event_Organizer__r.Name);
            
         }
    }
}