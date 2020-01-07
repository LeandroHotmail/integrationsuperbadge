trigger ContactUpdated on Contact (after update) {
    for (Contact c : Trigger.New)
    {
        System.debug('Hello World');
        System.debug('Fue modificado' + c.Id);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'ffukuda@achs.cl'};
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Actualización de datos');
        mail.setSubject('El caso ' + c.Id + ' fue modificado.');
        JSONGenerator json = JSON.createGenerator(true);
        json.writeStringField('numeroBP', c.NumeroBP__c);
        json.writeStringField('segundoNombre', c.SegundoNombre__c);
        json.writeStringField('apellidoMaterno', c.ApellidoMaterno__c);
        json.writeStringField('apellidoPaterno', c.ApellidoPaterno__c);
        json.writeStringField('nombre', c.Nombre__c);
        json.writeStringField('estadoCivil', c.EstadoCivil__c);
        json.writeStringField('ocupacion', c.Ocupacion__c);
        json.writeStringField('iniciales', c.Iniciales__c);
        String pretty = json.getAsString();
        mail.setPlainTextBody(pretty);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}