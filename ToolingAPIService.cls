public class ToolingAPIService {
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
    public enum SObjectType { ApexClass,ApexPage,AuraDefinitionBundle,AuraDefinition,LightningComponentBundle,LightningComponentResource}
    public HttpResponse queryAuraBundle(String bundleId){
        bundleId=String.escapeSingleQuotes(bundleId);
        HttpRequest request=createHttpRequest('GET');
        String queryFields=genrateSearchQuery(SObjectType.AuraDefinition);
        queryFields+=' WHERE AuraDefinitionBundleId=\''+bundleId+'\'';
        String query='/query/?q=' + EncodingUtil.urlEncode(queryFields, 'UTF-8');
        request.setEndpoint(BASE_URL+TOOLING_API_URI+query);
        return sendRequest(request);
    }
    public HttpResponse queryWebBundle(String bundleId){
        bundleId=String.escapeSingleQuotes(bundleId);
        HttpRequest request=createHttpRequest('GET');
        String queryFields=genrateSearchQuery(SObjectType.LightningComponentResource);
        queryFields+=' WHERE LightningComponentBundleId=\''+bundleId+'\'';
        String query='/query/?q=' + EncodingUtil.urlEncode(queryFields, 'UTF-8');
        request.setEndpoint(BASE_URL+TOOLING_API_URI+query);
        return sendRequest(request);
    }
    public HttpResponse queryMetadata(SObjectType metaType){
        HttpRequest request=createHttpRequest('GET');
        String queryFields=genrateSearchQuery(metaType);
        String query='/query/?q=' + EncodingUtil.urlEncode(queryFields, 'UTF-8');
        request.setEndpoint(BASE_URL+TOOLING_API_URI+query);
        return sendRequest(request);
        
    }
    public HttpResponse updateAuraDefinition(String body,string id){
        HttpRequest request=createHttpRequest('POST');
        request.setBody(body);
        request.setEndpoint(BASE_URL+TOOLING_API_URI+'/sobjects/AuraDefinition/'+id+'?_HttpMethod=PATCH');
        return sendRequest(request);
    }
    public HttpResponse updateWebDefinition(String body,string id){
        HttpRequest request=createHttpRequest('POST');
        request.setBody(body);
        request.setEndpoint(BASE_URL+TOOLING_API_URI+'/sobjects/LightningComponentResource/'+id+'?_HttpMethod=PATCH');
        return sendRequest(request);
    }
    private String genrateSearchQuery(SObjectType metaType){
        String queryFields=queryfieldsList.get(metaType);
        return 'SELECT '+queryFields+' FROM '+metaType;
    }
    private HttpResponse sendRequest(HttpRequest request){
        return http.send(request);
    }
    private HttpRequest createHttpRequest(String requestType){
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', 'OAuth ' + SESSION_ID);
        request.setHeader('Content-Type', 'application/json');
        request.setMethod(requestType);
        return request;
    }
    public static Map<String,SObjectType> getENUMforString=new  Map<String,SObjectType>{
        'ApexClass'=>SObjectType.ApexClass,
            'ApexPage'=>SObjectType.ApexPage,
            'AuraDefinition'=>SObjectType.AuraDefinition,
            'AuraDefinitionBundle'=>SObjectType.AuraDefinitionBundle,
            'LightningComponentBundle'=>SObjectType.LightningComponentBundle,
            'LightningComponentResource'=>SObjectType.LightningComponentResource
            };
                private static Map<SObjectType,String> queryfieldsList=new Map<SObjectType,String>{
                    SObjectType.ApexClass => 'Id,Name,LastModifiedDate,LastModifiedById,LastModifiedBy.Name,Body',
                        SObjectType.ApexPage  =>'Id,Name,LastModifiedDate,LastModifiedById,LastModifiedBy.Name,Markup',
                        SObjectType.AuraDefinitionBundle  =>'DeveloperName,MasterLabel,LastModifiedDate, LastModifiedById,LastModifiedBy.Name,Id',
                        SObjectType.AuraDefinition  =>'Id,LastModifiedDate,LastModifiedById,LastModifiedBy.Name,AuraDefinitionBundleId,DefType,Format,Source',
                        SObjectType.LightningComponentBundle  =>'description,masterLabel,LastModifiedDate,LastModifiedById,LastModifiedBy.Name,Id',
                        SObjectType.LightningComponentResource  =>'Id,FilePath,LastModifiedDate,LastModifiedById,LastModifiedBy.Name,Format,LightningComponentBundleId,Source'
                        };
                            }
