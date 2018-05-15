/*
 * VFUtil.cls
 */
public class VFUtil {

	public static void info( String message) {
		addMessage( ApexPages.Severity.INFO, message);
	}
	public static void warning( String message) {
		addMessage( ApexPages.Severity.WARNING, message);
	}
	public static void confirm( String message) {
		addMessage( ApexPages.Severity.CONFIRM, message);
	}
	public static void error( String message) {
		addMessage( ApexPages.Severity.ERROR, message);
	}
	public static void fatal( String message) {
		addMessage( ApexPages.Severity.FATAL, message);
	}
	private static void addMessage( ApexPages.Severity severity, String message) {
		ApexPages.addMessage( new ApexPages.Message( severity, message));
	}

	// Check for specifc page messages in apex pages
	public static Boolean hasMessage( String pageMessage) {
		if ( ApexPages.hasMessages() ) {
			for ( ApexPages.Message msg : ApexPages.getMessages()) {
				if ( msg.getDetail().contains( pageMessage)) {
					return true;
				}
			}
		}
		return false;
	}
}