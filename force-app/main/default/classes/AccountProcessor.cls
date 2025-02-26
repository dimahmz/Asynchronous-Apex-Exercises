public with sharing class AccountProcessor {
    public AccountProcessor() {

    }

    @future
    public static void countContacts(List<Id> Ids){
        List<Account> accounts = new List<Account>();
        for(Id id : Ids){
            Account acc = [SELECT NumberOfContacts__c ,(SELECT ID FROM Contact WHERE AccountId = :id) FROM Account WHERE Id = :id];
            acc.NumberOfContacts__c = (Integer) acc.Contacts.size();    
            accounts.add(acc);
        }
        update accounts;
    }
}