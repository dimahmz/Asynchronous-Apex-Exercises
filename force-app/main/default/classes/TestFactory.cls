@isTest
public class TestFactory {

    // acounts with the same number of contacts
    public static List<Account> generateAccountsWithContacts(Integer numAccounts, Integer  numContacts){
            List<Account> accounts = new List<Account>();
        
            for (Integer i = 0; i < numAccounts; i++) {
                Account account = new Account(Name = 'Test Account ' + i);
                accounts.add(account);
            }
        
            insert accounts;
        
            List<Contact> contacts = new List<Contact>();
        
            for (Account account : accounts) {
                for (Integer j = 0; j < numContacts; j++) {
                    Contact contact = new Contact(AccountId = account.Id, LastName = 'Test Contact ' + j);
                    contacts.add(contact);
                }
            }
        
            insert contacts;
        
            // Refresh the accounts list to include the inserted contacts
            List<Account> updated_accounts = [SELECT Id, 	Number_Of_Contacts__c , Name, (SELECT Id, LastName FROM Contacts) FROM Account WHERE Id IN :accounts];
        
            return updated_accounts;
        }

    // acounts with different number of contacts
    public static List<Account> generateAccountsWithContacts(Integer numAccounts, List<Integer> numContacts){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < numAccounts; i++){
            Account acc = new Account(Name = 'Test Account ' + i);
            accounts.add(acc);
        }
        insert accounts;

        List<Contact> contacts = new List<Contact>();
        Integer j = 0;
        for(Account acc : accounts){
            for(Integer i = 0; i < numContacts[j]; i++){
                Contact con = new Contact(AccountId = acc.Id, LastName = 'Test Contact ' + i);
                contacts.add(con);
            }
            j++;
        }
        insert contacts;

        List<Account> updated_accounts = [SELECT Id, 	Number_Of_Contacts__c , Name, (SELECT Id, LastName FROM Contacts) FROM Account WHERE Id IN :accounts];
        
        return updated_accounts;
    }



}