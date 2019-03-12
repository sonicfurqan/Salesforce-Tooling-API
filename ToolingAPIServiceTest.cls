@isTest
public class ToolingAPIServiceTest {
    @isTest
    static void ToolingAPIServiceTest(){
        Test.setMock(HttpCalloutMock.class, new ToolingAPIServiceMock('[{}]'));
 	Test.startTest();
        ToolingAPIService service=new ToolingAPIService();
        service.query('');
	service.createApexClass('','');
	service.createApexPage('','');
	service.createLightingComponent('');
	service.createLightingComponentFile('','','');
	service.createLightingWEBComponent('');	        
	service.createLightingWEBComponentFile('','','','','','');
        
        
        Test.stopTest();
    }
	public class ToolingAPIServiceMock implements HttpCalloutMock {
        private String testResponse;
        public ToolingAPIServiceMock(String testResponse){
            this.testResponse = testResponse;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setBody(testResponse);
            return res;
        }
    }
}
