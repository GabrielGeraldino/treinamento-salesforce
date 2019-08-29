/**
 * @author: gabriel geraldino
 */


@isTest
public class RestProxyTest {
    
    @isTest
    public static void sendHttpGetTest () {

        String payload = '{"unidade":"","uf":"SP","logradouro":"","localidade":"Pompéia","ibge":"3540002","gia":"5484","complemento":"","cep":"17580-000","bairro":""}';
        Test.setMock ( HttpCalloutMock.class , new RestProxyMock(payload));   
    
        RestProxy proxy = new RestProxy ( new RestProxy.Configuration ('https://viacep.com.br/ws/','GET') );

        String response = proxy.get ('12345678/json/');

        System.assertEquals (payload, response);

    }

    public class RestProxyMock implements HttpCalloutMock {

        String payload;
        
        public RestProxyMock (String payload){
                this.payload = payload;
        }

        public HttpResponse respond (HttpRequest request){
            HttpResponse response = new HttpResponse();
            response.setBody (payload);
            return response;
        }   

    }

}