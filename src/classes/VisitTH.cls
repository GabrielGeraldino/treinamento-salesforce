/**
 * @author: gabriel geraldino
 */

public with sharing class VisitTH extends TriggerHandler {

    List<Visita__c> newVisits;
    Map<Id, Visita__c> oldVisits;

    AccountEnricher accountEnricher;
    VisitFilter filter;

    public VisitTH(){
        this( (List<Visita__c>)Trigger.new , (Map<Id, Visita__c>)Trigger.oldMap );
    }
    
    public VisitTH( List<Visita__c> newVisits, Map<Id, Visita__c> oldVisits){
        this.newVisits = newVisits;
        this.oldVisits = oldVisits;

        accountEnricher = new AccountEnricher();
        filter = new VisitFilter();
    }

    override
    public void afterInsert(){
        enricherAccountWithLastExecutedDate ();
    }

    override
    public void afterUpdate(){
        enricherAccountWithLastExecutedDate ();
    }

    public void enricherAccountWithLastExecutedDate () {

        List<Visita__c> executedVisits = filter.filterJustExecutedVisitForAccount ( newVisits, oldVisits );

        accountEnricher.enricheWithLastExecutedVisit (executedVisits); 

    }
    
}