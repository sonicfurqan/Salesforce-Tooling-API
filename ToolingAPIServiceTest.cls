@isTest
public class ToolingAPIServiceTest {
    @isTest
    static void ToolingAPIServiceTest(){
        Test.setMock(HttpCalloutMock.class, new ToolingAPIServiceMock('[{}]'));
         Test.startTest();
        ToolingAPIService service=new ToolingAPIService();
        service.queryMetadata(ToolingAPIService.getENUMforString.get('ApexClass'));
        service.queryMetadata(ToolingAPIService.getENUMforString.get('ApexPage'));
        service.queryAuraBundle('queryAuraBundle');
        service.queryWebBundle('queryWebBundle');
        service.updateAuraDefinition('queryAuraBundle','id');
        service.updateWebDefinition('queryWebBundle','id');
        
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
