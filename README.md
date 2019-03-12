# SalesForce-Tooling-API
Helper method to create apex,visualforce,lighting component,lighting web component using tooling api

Tooling Api End Points 
1.Querying files = /services/data/v43.0/tooling/query?q=
  a.Fetching apex select+id+from+apexclass
  b.Fetching vf select+id+from+apexpage
  c.Fetching lighting component select+id+from+AuraDefinition 
  d.Fetching lighting web component select+id+from+LightningComponentResource
   
1.Inserting Apex class =/services/data/v45.0/tooling/sobjects/ApexClass<br/>
  a.Post Method
  b.JSON Request Body
      {
        "Name":"myclass",
        "Body":"public class myclass{}"
      }
      
      
2.Inserting Vf Page = /services/data/v45.0/sobjects/ApexPage
    a.Post Method
    b.JSON Request Body
      {
        "Name":"my_page",
        "Markup":"<apex:page ></apex:page>",
        "MasterLabel":"my_page"
      }
     
 3.1 Inserting lighitng component Bundle =  /services/data/v45.0/sobjects/AuraDefinitionBundle 
     a.Post Method
     b.JSON Request Body
         { "DeveloperName":"my_cmp", "MasterLabel":"my_cmp", "Description":"cmp","ApiVersion":"45" }
     c.response is auradefenationbundel id used in creating aura bundle

3.2 Inserting lighitng component  Resourse  =  /services/data/v45.0/sobjects/AuraDefinition
    a.Post Method
    b.JSON Request Body
        {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"CONTROLLER",
         "Format":"JS",
        "Source":"({myMethod  : function(component, event, helper) {}})"
      }

3.3 Inserting lighitng component Controller  Resourse  =  /services/data/v45.0/sobjects/AuraDefinition
    a.Post Method
    b.JSON Request Body
        {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"CONTROLLER",
         "Format":"JS",
        "Source":"({myMethod  : function(component, event, helper) {}})"
      }
       
3.4 Inserting lighitng component Css  Resourse  =  /services/data/v45.0/sobjects/AuraDefinition
    a.Post Method
    b.JSON Request Body
        {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"STYLE",
         "Format":"CSS",
        "Source":".THIS{}"
      }
       
4.1 Inserting lighitng web component Bundle =  /services/data/v45.0/sobjects/LightningComponentBundle
     
