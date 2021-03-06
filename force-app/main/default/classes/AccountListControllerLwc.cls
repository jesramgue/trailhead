public with sharing class AccountListControllerLwc {
    @AuraEnabled(cacheable=true)
    public static List<Account> queryAccountsByEmployeeNumber(Integer numberOfEmployees) {
        return [
            SELECT Name
            FROM Account
            WHERE NumberOfEmployees >= :numberOfEmployees
        ];
   }
   @AuraEnabled(cacheable=true)
   public static List<Account> queryAccountsByRevenue(Decimal annualRevenue){
       try {
        return [
            SELECT Name
            FROM Account
            WHERE AnnualRevenue >= :annualRevenue
        ];
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }
}