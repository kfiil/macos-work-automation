JsOsaDAS1.001.00bplist00�Vscript_t// Inspiration http://blog.hakanserce.com/post/outlook_automation_mac/
var outlook = Application("Microsoft Outlook");
var app = Application.currentApplication();
app.includeStandardAdditions = true;

var selectedMessage = outlook.selectedObjects()[0];

if(selectedMessage == undefined){
	app.displayNotification(
      'Please select a message in Outlook before running the script!', 
      {
        withTitle: "Microsoft Outlook link",
        subtitle:  "NO SELECTION was made!",
        soundName: "Glass.aiff"
      });
} else {
	var selectedMessageId = selectedMessage.id();
	var selectedMessageUri = 'outlook://' + selectedMessageId;
	app.displayNotification(selectedMessageUri);
	app.setTheClipboardTo(selectedMessageUri);
	
	app.displayNotification(
      selectedMessageUri, 
      {
        withTitle: "Outlink link copied",
        soundName: "Glass.aiff"
      });
}



                              �jscr  ��ޭ