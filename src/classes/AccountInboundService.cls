/**
 * @author: gabriel geraldino
 */

@RestResource ( urlMapping='/api/account/*' )
global class AccountInboundService {

    webservice
    static Account store (Customer customer){
        
        Account account = new Account (name = customer.name, BillingStreet = Customer.BillingAddress,Id = customer.Id);
        
        new AccountRepository().save (account);

        customer.Id = account.Id;

        return account;

    }

    @HttpPost
    global static Account save (Account account){
        return new AccountRepository().save (account);
    }
}

