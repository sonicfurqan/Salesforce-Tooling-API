public class ToolingAPIService {
    private final String APIVERSION = '45';
    private final String BASE_URL = URL.getSalesforceBaseUrl().toExternalForm();
    private final String TOOLING_API_URI = '/services/data/v45.0/tooling' ;
    private final String SESSION_ID{
        private set;get{
            PageReference visualforcePage=Page.generateSessionId;
            String content = visualforcePage.getContent().toString();
            Integer s = content.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),
                e = content.indexOf('End_Of_Session_Id');
            return content.substring(s, e);
        }
    }
    private Http http;
    public ToolingAPIService(){
        http=new Http();
    }

    public HttpResponse query(String q){
        HttpRequest request=createHttpRequest('GET');
        q=q.replace(' ','+');
        request.setEndpoint(request.getEndpoint()+'/query?q='+q);
        return sendRequest(request);
    }

    public HttpResponse createApexClass(String className,String classBody){
        HttpRequest request=createHttpRequest('POST');
        request.setEndpoint(request.getEndpoint()+'/sobjects/ApexClass');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();     
        gen.writeStringField('Name',className);
        gen.writeStringField('Body',classBody);
        gen.writeEndObject();
        request.setBody(gen.getAsString());
        return sendRequest(request);
    }
    public HttpResponse createApexPage(String pageName,String pageBody){
        HttpRequest request=createHttpRequest('POST');
        request.setEndpoint(request.getEndpoint()+'/sobjects/ApexClass');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();     
        gen.writeStringField('Name',pageName);
        gen.writeStringField('Markup',pageBody);
        gen.writeStringField('MasterLabel',pageName);
        gen.writeEndObject();
        request.setBody(gen.getAsString());
        return sendRequest(request);
    }

    public HttpResponse createLightingComponent(String componentName){
        HttpRequest request=createHttpRequest('POST');
        request.setEndpoint(request.getEndpoint()+'/sobjects/AuraDefinitionBundle ');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();     
        gen.writeStringField('DeveloperName',componentName);
        gen.writeStringField('MasterLabel',componentName);
        gen.writeStringField('Description',componentName);
        gen.writeStringField('ApiVersion',APIVERSION);
        gen.writeEndObject();
        request.setBody(gen.getAsString());
        return sendRequest(request);
    }
     public HttpResponse createLightingComponentFile(String componentId,String type,String body){
         //List<String> supportedTypes=new List<String>{'CONTROLLER','COMPONENT','HELPER','RENDERER','STYLE','DESIGN'};
        HttpRequest request=createHttpRequest('POST');
        request.setEndpoint(request.getEndpoint()+'/sobjects/AuraDefinition ');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();     
        gen.writeStringField('AuraDefinitionBundleId',componentId);
        gen.writeStringField('DefType',type);
        if(type='CONTROLLER' ||type='HELPER' ||type='RENDERER'){
            gen.writeStringField('Format','JS');
        }
        if(type='STYLE'){
            gen.writeStringField('Format','CSS');
        }
        if(type='COMPONENT'  || type='DESIGN'){
        gen.writeStringField('Format','XML ');
        }
        gen.writeStringField('Source',body);
        gen.writeEndObject();
        request.setBody(gen.getAsString());
        return sendRequest(request);
    }

    public HttpResponse createLightingWEBComponent(String cmponentName){
        HttpRequest request=createHttpRequest('POST');
        request.setEndpoint(request.getEndpoint()+'/sobjects/LightningComponentBundle ');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();     
        gen.writeStringField('FullName',cmponentName);
        gen.writeFieldName('Metadata');
        gen.writeStartObject();
        gen.writeStringField('masterLabel',cmponentName);
        gen.writeEndObject();
        gen.writeEndObject();
        request.setBody(gen.getAsString());
        return sendRequest(request);
    }

public HttpResponse createLightingWEBComponentFile(String componentId,String componentName,
                                                    String filename,String format,String body){
        //List<String> supportedFormats=new List<String>{'css','html','js','xml'};
        HttpRequest request=createHttpRequest('POST');
        request.setEndpoint(request.getEndpoint()+'/sobjects/LightningComponentResource ');
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();     
        gen.writeStringField('LightningComponentBundleId',componentId);
        gen.writeStringField('FilePath','lwc/'+componentName+'/'+filename);
        gen.writeStringField('Format',format);
        gen.writeStringField('Source',body);
        gen.writeEndObject();
        request.setBody(gen.getAsString());
        return sendRequest(request);
    }
    


    private HttpRequest createHttpRequest(String requestType){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL+TOOLING_API_URI);
        request.setHeader('Authorization', 'OAuth ' + SESSION_ID);
        request.setHeader('Content-Type', 'application/json');
        request.setMethod(requestType);
        return request;
    }
  
                            }
