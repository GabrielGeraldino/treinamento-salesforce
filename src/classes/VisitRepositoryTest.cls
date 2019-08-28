/**
 * @author: gabriel geraldino
 */

@isTest
private class VisitRepositoryTest {

    @isTest
    public static void findByZipCodeTest () {
        
        Visita__c visit = VisitFixtureFactory.create('12312312');

        Account account = AccountFixtureFactory.create('gabriel');

        VisitRepository repository = new VisitRepository();

        List<Visita__c> visits = repository.findByZipCode ('123%');

        System.assert ( !visits.isEmpty() ); 
        System.assertEquals ( visit.Id , visits.get(0).Id);

    }

}