public with sharing class AccountProcessor {

    @future
    public static void countContacts(List<Id> Ids){
        List<Account> accounts = new List<Account>();
        for(Id id : Ids){
            Account acc = [SELECT Number_Of_Contacts__c, Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Id = :id];
            acc.Number_Of_Contacts__c = acc.Contacts.size();    
            accounts.add(acc);
        }
        update accounts;
    }
}