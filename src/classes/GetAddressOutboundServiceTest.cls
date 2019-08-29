/**
 * @author: gabriel geraldino
 */

@isTest
public class GetAddressOutboundServiceTest {

    @isTest
    public static void getAddressByZipCodeTest(){

        ZipCodeAddress expected = new ZipCodeAddress();
        expected.cep = '12312312';
        expected.logradouro = 'Rua X';

        GetAddressOutboundService service = new GetAddressOutboundService();
        service.setProxy (new RestProxyMock(JSON.serialize(expected)));

        ZipCodeAddress ZipCodeAddress = service.getAddressByZipCode('12345678');
        
        System.assertEquals(expected.cep,ZipCodeAddress.cep);
        System.assertEquals(expected.logradouro,ZipCodeAddress.logradouro);

    }

    public virtual class RestProxyMock extends RestProxy {

        String payload;
        public RestProxyMock (String payload){
            super(new RestProxy.Configuration ('https://viacep.com.br/ws/','GET'));
            this.payload = payload;
        }

        override
        public virtual String get (String path) {
            return payload;
        }

    }

}
