/**
 * Test VFUtil Methods
 */
@isTest (SeeAllData=false)
private class VFUtilTest {

	static TestMethod void testAllMessages() {
		// Arrange
		// Act
		VFUtil.warning( 'Warning Message');
		VFUtil.error( 'Error Message');
		VFUtil.fatal( 'Fatal Message');
		VFUtil.info( 'Information Message');
		VFUtil.confirm( 'Confirm Message');
		// Assert
		System.assert( VFUtil.hasMessage( 'Fatal Message'));
		System.assert( !VFUtil.hasMessage( 'Negative Test Case'));
	}

}
