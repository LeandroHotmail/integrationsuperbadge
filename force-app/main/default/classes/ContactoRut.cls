@RestResource(urlMapping='/api/Contact/Rut/*')
global with sharing class ContactoRut
{
       
    @HttpGet
    global static Contact[] doGet() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Contact[] result = [SELECT NumeroBP__c FROM Contact WHERE Rut__c = :AccNumber ];
        return result;
    }
    
}