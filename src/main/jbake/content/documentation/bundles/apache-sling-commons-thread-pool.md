title=Apache Sling Commons Thread Pool
type=page
status=published
tags=core,threads
~~~~~~

The Apache Sling Commons Thread Pool bundle provides a thread pool services. All thread pools are managed by the `org.apache.sling.commons.threads.ThreadPoolManager`. This service can be used to get a thread pool.

Thread pools are managed by name - there is a default thread pool and custom thread pools can be generated on demand using a unique name.

The thread pools are actually wrappers around the thread pool support (executor) from the Java library. The advantage of using this thread pool service is, that the pools can be configured and managed through OSGi configurations.

## Create a new thread pool

A new thread pool is configured by creating a new instance of the "Apache Thread Pool Configuration" Factory. These settings are supported:

|Name|Default|Description|
|----|-------|-----------|
|name| (autogenerated by the system) | the name of the thread pool|
|minPoolSize | 5  | the minimal number of threads which should always be available |
|maxPoolSize | 5  | the maximum number of threads which this thread pool is allowed to use  |
|queueSize   | -1 (unlimited)  |  the length of the queue which is used to hold tasks until they get processed |
|maxThreadAge  | -- | (deprecated, see [SLING-6261](https://issues.apache.org/jira/browse/SLING-6261); any value will be ignored)|
|keepAliveTime   | 60000 (msec)  | time after which idle threads in the pool will be terminated (down to the number specified by ```minPoolSize```)  |
|blockPolicy   | Run  |  Defines the [policy of the underlaying ThreadPool Executor](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/ThreadPoolExecutor.html) in case a task is rejected. |
|shutdownGraceful   | no  | if graceful shutdown is not configured, all queued tasks (which are not yet processed) will not be executed but dropped on shutdown; if configured all queued tasks will be executed before shutting down the thread pool|
|daemon   | no   | Should the "Daemon"  flag be set on the threads in this thread pool?  |
|shutdownWaitTime   | -1   | Delays the shutdown for the specified amount of miliseconds to give already running tasks time to complete. A value lower than 1 means not to wait. |
|priority   | norm  | the priority of the threads in this thread pool   |

But of course it is also possible to generate a thread pool via code like this. Just make sure that you release the threadpool when you don't longer use it.

    @Reference
    ThreadPoolManager threadPoolManager;

    ThreadPool myThreadPool;

    public void setupThreadPool() {
      ModifiableThreadPoolConfig config = new ModifiableThreadPoolConfig();
      config.setMinPoolSize(0); // if no work needs to be done, we don't need a thread hanging around
      [...]
      myThreadPool = threadPoolManager.create(config, "my-thread-pool");
    }

    public void releaseThreadPool() {
      threadPoolManager.release(myThreadPool);
    }


## How to use a thread pool

A typical case is that you want to schedule tasks to be executed in the thread pool ```my-thread-pool```, which you have to configure upfront. You have to acquire the the specific thread pool first via the ```ThreadPoolManager``` service. When you don't use the thread pool anymore, you have to release it.


    @Reference
    ThreadPoolManager threadPoolManager;

    ThreadPool myThreadPool;

    @Activate
    public void activate() {
      myThreadPool = threadPoolManager.get("my-thread-pool");
    }

    @Deactivate
    public void deactivate() {
      threadPoolManager.release(myThreadPool);
    }

    public void doSomething() {
      myThreadPool.execute (() -> {
        // submit a runnable to this threadpool
        });
    }

This example executes the runnables in a fire-and-forget manner, but you can also use the [```submit()``` methods](https://sling.apache.org/apidocs/sling11/index.html?org/apache/sling/commons/threads/ThreadPool.html) to get a Future for the submitted task.


In case the requested thread pool is not available, a new thread pool with the default configuration will be returned. In case you create a threadpool with the same name again later, the new configuration will be applied to the already existing thread pool.

## The Webconsole plugin

The ```Sling Thread Pools```webconsole plugin displays all configured thread pools including their settings, including some basic statistics about the number of threads already processed in these thread pools.
