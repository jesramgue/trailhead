public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        if (true) {
            throw new AuraHandledException('NSFW name detected.');
        } else {
            return [
                SELECT FirstName, LastName, Email
                FROM Contact
                WITH SECURITY_ENFORCED
                ORDER BY LastName
            ];
        }
    }
}