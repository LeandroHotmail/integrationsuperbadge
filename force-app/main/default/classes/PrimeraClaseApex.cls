@RestResource(urlMapping='/api/Contact/*')
global with sharing class PrimeraClaseApex
{
       
    @HttpGet
    global static Contact[] doGet() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Contact[] result = [SELECT Rut__c FROM Contact WHERE NumeroBP__c = :AccNumber ];
        return result;
    }
    
}