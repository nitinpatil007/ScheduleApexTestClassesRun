public class RunTestScheduler implements Schedulable {
    public void execute(SchedulableContext sc){
        RunTestUtil.enqueueTests();
    }
}
