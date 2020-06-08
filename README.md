# ScheduleApexTestClassesRun
These schedulers will schedule the Test Classes run as a nightly job and send the email to Recipients with the status of all apex test classes
and method names
#RunTestScheduler Apex class implements schedulable interface and inserts the Apex Test classes mentioned in Run_Test__c custom settings
to ApexTestQueueItem for running the tests. Also It creates a record in Test_Run_Detail__c custom object with Name = ApexTestQueueItem.ParentJobId,
Email = Recipient Email Ids FROM Custom Setting OR if it's empty then Current User Email Id.
#RunTestSendEmailScheduler Apex class implements schedulable interface and checks the status of the ApexTestRunResult job using Test_Run_Detail__c custom object
records. If the Status is Completed/Aborted/Failed, it'll send an email and delete the Test_Run_Detail__c record.
If the status is enqueued/processing, It will not do any processing. So, Again When Job will run next day, it'll check for the same record.along with new records.
#RunTestUtil Apex class is the helper class which contains 2 methods - 
1. enqueueTests() => It's referenced in RunTestScheduler Apex class. gets Test Class names from Run_Test__c custom settings and insert into ApexTestQueueItem. ALso, creates Test_Run_Detail__c custom object record.
2. checkAndSendEmailToRecipient() - It's referenced in RunTestSendEmailScheduler Apex class. 
#RunTestSchedulerTest Test class for RunTestScheduler class.
