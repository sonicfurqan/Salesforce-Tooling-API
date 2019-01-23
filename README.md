# SalesForce-Tooling-API
Helper method to create apex,visualforce,lighting component,lighting web component using tooling api

Tooling Api End Points 
1.Querying files = /services/data/v43.0/tooling/query?q=<br/>
  a.Fetching apex select+id+from+apexclass<br/>
  b.Fetching vf select+id+from+apexpage<br/>
  c.Fetching lighting component select+id+from+AuraDefinition <br/>
  d.Fetching lighting web component select+id+from+LightningComponentResource <br/>
   
1.Inserting Apex class =/services/data/v45.0/tooling/sobjects/ApexClass<br/>
  a.Post Method<br/>
  b.JSON Request Body<br/>
      ```
      {
        "Name":"myclass",
        "Body":"public class myclass{}"
      }
      ```
      <br/>
2.Inserting Vf Page = /services/data/v45.0/sobjects/ApexPage<br/>
    a.Post Method<br/>
    b.JSON Request Body<br/>
      ```
      {
        "Name":"my_page",
        "Markup":"<apex:page ></apex:page>",
        "MasterLabel":"my_page"
      }
     ```
     <br/>
 3.1 Inserting lighitng component Bundle =  /services/data/v45.0/sobjects/AuraDefinitionBundle <br/>
     a.Post Method<br/>
     b.JSON Request Body<br/>
        ``` {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"COMPONENT",
        "Format":"XML",
        "Source":"<aura:component></aura:component>"
      }
       ```<br/>
     c.response is auradefenationbundel id used in creating aura bundle
3.2 Inserting lighitng component  Resourse  =  /services/data/v45.0/sobjects/AuraDefinition <br/>    
    a.Post Method<br/>
    b.JSON Request Body<br/>
        ```     {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"CONTROLLER",
         "Format":"JS",
        "Source":"({myMethod  : function(component, event, helper) {}})"
      }
       ```<br/>
3.3 Inserting lighitng component Controller  Resourse  =  /services/data/v45.0/sobjects/AuraDefinition <br/>    
    a.Post Method<br/>
    b.JSON Request Body<br/>
        ```      {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"CONTROLLER",
         "Format":"JS",
        "Source":"({myMethod  : function(component, event, helper) {}})"
      }
       ```<br/>
3.4 Inserting lighitng component Css  Resourse  =  /services/data/v45.0/sobjects/AuraDefinition <br/>    
    a.Post Method<br/>
    b.JSON Request Body<br/>
        ```       {
        "AuraDefinitionBundleId":"0Ab6F000000XXXXXX",
        "DefType":"STYLE",
         "Format":"CSS",
        "Source":".THIS{}"
      }
       ```<br/>
4.1 Inserting lighitng web component Bundle =  /services/data/v45.0/sobjects/LightningComponentBundle <br/>
     
