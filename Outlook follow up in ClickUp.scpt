JsOsaDAS1.001.00bplist00�Vscript_�// Inspiration http://blog.hakanserce.com/post/outlook_automation_mac/
var outlook = Application("Microsoft Outlook");
var app = Application.currentApplication();
app.includeStandardAdditions = true;

var selectedMessage = outlook.selectedObjects()[0];

if(selectedMessage == undefined){
	app.displayNotification(
      'Please select a message in Outlook before running the script!', 
      {
        withTitle: "Microsoft Outlook Follow Up Copy link",
        subtitle:  "NO SELECTION was made!",
        soundName: "Glass.aiff"
      });
} else {
	var selectedMessageSubject = selectedMessage.subject();
	var selectedMessageId = selectedMessage.id();
	var selectedMessageUri = 'outlook://' + selectedMessageId;
	var message = 'Follow up: ' + selectedMessageSubject + ' - ' + selectedMessageUri;
	app.displayNotification(message);
	app.setTheClipboardTo(message);
	
	app.displayNotification(
      message, 
      {
        withTitle: "Follow up link copied",
        soundName: "Glass.aiff"
      });
	  
	app.doShellScript('curl --include --request POST --header "Authorization: pk_4533824_UKVHRE6HWKETZ2CS7M3ONK8A4FJAQE83" --header "Content-Type: application/json" --data-binary \'{"name": "' + message + '","content": "' + message + '","assignees": [4533824],"tags": ["created from api", "Outlook follow up", "email"],"status": "TO DO","notify_all": true,"parent": null}\' "https://api.clickup.com/api/v2/list/15165757/task"');
}



                              � jscr  ��ޭ