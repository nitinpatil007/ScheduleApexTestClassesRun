/*  @Author         : Nitin Patil
 *  @CreatedDate    : 5th June 2020 
 *  @Version        : 1.0
 *  @Desc           : This is a Test class for RunTestScheduler Apex Class. 
                      As we have to run Test classes, we have to use (SeeAllData=true)
*/

@isTest(SeeAllData=true)
private class RunTestSchedulerTest {
    @isTest
    private static void testPositiveScenario(){
        
        Test.startTest();
        String sch = '0 45 1 10 * ?';
        String jobId = System.schedule('RunTest Job', sch, new RunTestScheduler());
        Test.stopTest();
        System.assert(jobId != NULL);
    }
}