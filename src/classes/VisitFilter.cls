/**
 * @author: gabriel geraldino
 */

public class VisitFilter {

    public List<Visita__c> filterJustExecutedVisitForAccount( List<Visita__c> newVisits , Map<Id, Visita__c> oldVisits ){
        
        List<Visita__c> executedVisits = new List<Visita__c>();

        for (Visita__c visit : newVisits) {

            if (visit.Conta__c == null) continue;

            Visita__c oldVisit;

            if (oldVisit != null) oldVisit = oldVisits.get (visit.Id);
            
            if ( oldVisit == null && visit.Status__c == 'REALIZADA' ){
                executedVisits.add (visit);
                continue;
            }
            
            if (oldVisit.Status__c ==  'REALIZADA' && oldVisit.Status__c != Visit.Status__c ){
                executedVisits.add (visit);
            }
        }

        return executedVisits;
        
    }

}