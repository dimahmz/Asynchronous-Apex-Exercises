/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AccountProcessorTest {

    @isTest
    static void testCountContacts() {

        // generate data for testing

        // generate 12 accounts with 3 contacts in each one
        List<Acccount> accounts = TestFactory.generateAccountsWithContacts(12, 3);

        // Create a list to hold the account IDs
        List<Id> accountIds = new List<Id>();

        // Loop through the accounts and collect their IDs
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        AccountProcessor.countContacts(AccountIds);


        for(Account acc : accounts){
            System.areEqual(acc.NumberOfContacts__c, 3, 'Account with the id : ' + acc.Id + ' has the wrong number of Contacts (Expected: 3, Actual: ' + acc.NumberOfContacts__c + ')');
        }

    }   
}