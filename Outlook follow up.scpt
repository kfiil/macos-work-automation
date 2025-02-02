JsOsaDAS1.001.00bplist00�Vscript_�// Inspiration http://blog.hakanserce.com/post/outlook_automation_mac/
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
	var message = 'Follow up: "' + selectedMessageSubject + '" - ' + selectedMessageUri;
	app.displayNotification(message);
	app.setTheClipboardTo(message);
	
	app.displayNotification(
      message, 
      {
        withTitle: "Follow up link copied",
        soundName: "Glass.aiff"
      });
}



                              	 jscr  ��ޭ