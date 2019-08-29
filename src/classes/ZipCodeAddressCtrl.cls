/**
 * @author: gabriel geraldino
 */

public class ZipCodeAddressCtrl {
    
    public Account account  {get;set;}

    GetAddressOutboundService service;
    
    public ZipCodeAddressCtrl () {
        service = new GetAddressOutboundService();
    }

    public ZipCodeAddressCtrl (ApexPages.StandardController standardCController){
        this();
        this.account = (Account) standardCController.getRecord();
    }

    public void loadZipCode(){
        ZipCodeAddress address = service.getAddressByZipCode(account.billingPostalCode);

        account.billingStreet = address.logradouro;
        account.billingCity = address.localidade;
        account.billingState = address.uf;
    }

}