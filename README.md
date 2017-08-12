# Robot Framework - Keyword Tutorial


<a name="toc"></a>
## Table of Contents

* [Introduction](#introduction)
* [sample-0-trivial](#sample-0-trivial)
* [sample-1-own-keyword](#sample-1-own-keyword)
* [sample-2-remote-keywords](#sample-2-remote-keywords)
* [sample-3-variables](#sample-3-variables)
* [sample-4-tagging](#sample-4-tagging)
* [sample-5-setup-teardown](#sample-5-setup-teardown)
* [sample-6-parameter](#sample-6-parameter)
* [sample-7-conditional-execution](#sample-7-conditional-execution)
* [sample-8-database](#sample-8-database)
* [sample-9-file-processing](#sample-9-file-processing)
* [sample-10-collections](#sample-10-collections)


<a name="introduction"></a>
## Introduction and Purpose

The main idea of this project is to have easy and out-of-the-box working examples on how to work with the [Robot Framework](http://www.robotframework.org). And here especially with its most central feature, namely, _Keywords_.

Therefore the tutorial is splitted into really small sections and is always only using those _Keywords_ that are part of the Robot Framework out-of-the-box. Thus no additional installation is required beside having a running _Robot Framework_ installation and forking/cloning this repository to try around with the examples.
I hope this tutorial can help on the one hand side to get a basic understanding how _Testsuites_ are written with the _Robot Framework_ using _Keywords_. Furthermore this might serve as a quick reference for more experienced users to just quickly take a look on how a certain feature is used (or a certain syntax).

__Note:__ All examples are shortly explained in the following and it is shown how to start the example either using _robot_ or the _Java installation_ of the _Robot Framework_. It is required that _robot_ can be found from the PATH on your machine for this to work and the path to the Robot-JAR will most likely differ ;-). __It is expected that the execution is always triggered from the directory containing the _Testsuite_-files.__

[top](#toc)

<a name="sample-0-trivial"></a>
## sample-0-trivial

This contains the most basic example on how to define a testcase using keywords (here only the __Log__ keyword is used that prints to the generated log-file). __Note:__ There must be at least two spaces to separate arguments from keywords and arguments from each other. Furthermore there must be always an indention of two spaces in the beginning of each line below a testcase.  

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-0-trivial/sample-0-trivial.txt)  
robot --outputdir ./report sample-0-trivial.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-trivial.txt

----------------------------------------------------------------------------------------------------------------

The next example shows how to import a Library (in this case the String Library). It also shows a simple for-loop. __Please note__ that the "\" are required in the lines belonging to the loop.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-0-trivial/sample-1-trivial-extended.txt)  
robot --outputdir ./report sample-1-trivial-extended.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-trivial.txt

[top](#toc)

<a name="sample-1-own-keyword"></a>
## sample-1-own-keyword

One of the key features of the _Robot Framework_ is the possibility to combine existing _Keywords_ into new _Keywords_ within some text files. This first example shows the most simple way of defining a customized keyword within the _Testsuite_-file.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-1-own-keyword/sample-0-own-keyword.txt)    
robot --outputdir ./report sample-0-own-keyword.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-own-keyword.txt

----------------------------------------------------------------------------------------------------------------

The second example shows the usage of an array as a parameter for a customized _Keyword_.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-1-own-keyword/sample-1-own-keyword.txt)    
robot --outputdir ./report sample-1-own-keyword.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-1-own-keyword.txt

----------------------------------------------------------------------------------------------------------------

In this example the customized _Keyword_ is moved to an external _Resource_-file that is then used from within the _Testsuite_.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-1-own-keyword/sample-2-own-keyword-resource.txt)  |  [VIEW RESOURCE FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-1-own-keyword/resource-2.txt)      
robot --outputdir ./report sample-2-own-keyword-resource.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-2-own-keyword-resource.txt

[top](#toc)

<a name="sample-2-remote-keywords"></a>
## sample-2-remote-keywords

Using a remote library can be extremely helpful as it allows writing Keyword-Libraries in any programming language as long as it offers a XML-RPC interface. The example make use of a [very simple example of such a remote library that has been written in Java](https://github.com/ThomasJaspers/remote-keyword-library).

To make this example usable out of the box the corresponding JAR-File (implementing the remote library) is part of the example directory and can be started right away.

__Test preparation__  
Start the Remote Keyword Server by issuing (__Note:__ The sample server is using port 8270):  
java -jar server/sample-remote-library-1.0-server.jar  

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-2-remote-keywords/sample-0-remote.txt)      
robot --outputdir ./report sample-0-remote.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-remote.txt

[top](#toc)

<a name="sample-3-variables"></a>
## sample-3-variables

Variables are offering a lot of possibilities when writing tests with the Robot Framework. The following sample shows a most basic example on how to use variables.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-3-variables/sample-0-variables.txt)      
robot --outputdir ./report sample-0-variables.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-variables.txt

----------------------------------------------------------------------------------------------------------------

This example gives an example on how global variable values can be temporarily overwritten in the scope of a testcase. Note that this does not permanently change the value of the globally defined variable.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-3-variables/sample-1-variables-scope.txt)      
robot --outputdir ./report sample-1-variables-scope.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-1-variables-scope.txt

----------------------------------------------------------------------------------------------------------------

This example shows the usage of variable files. This is especially useful to define certain values (like URLs or database connections) differently for different test environments. The variable files are then passed in via a command line option.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-3-variables/sample-2-variables-file.txt) | [VIEW LOCAL VARIABALE FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-3-variables/variable-file-env-local.py) | [VIEW TEST VARIABLE FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-3-variables/variable-file-env-test.py)      
robot --outputdir ./report --variablefile ./variable-file-env-local.py sample-2-variables-file.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report --variablefile ./variable-file-env-local.py sample-2-variables-file.txt

__Note:__ Change the variable-file passed in and take a look at the resulting log-file.

[top](#toc)

<a name="sample-4-tagging"></a>
## sample-4-tagging

Tagging is a useful feature to have some kind of test coverage in the generated report. Just _tag_ each testcase with the proper - uhm - _tags_. __Note:__ Make sure you are using unique tag-names for the same features.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-4-tagging/sample-0-tagging.txt)      
robot --outputdir ./report sample-0-tagging.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-tagging.txt

[top](#toc)

<a name="sample-5-setup-teardown"></a>
## sample-5-setup-teardown

_Setup-_ and _Teardown_-functions (_Keywords_) are very helpful to separate preparation tasks from the real test execution. Furthermore it allows to perform global steps for a testsuite once (in the beginning and end). This is shown in the following example.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-5-setup-teardown/sample-0-suite.txt)      
robot --outputdir ./report sample-0-suite.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-suite.txt

----------------------------------------------------------------------------------------------------------------

It is also possible to define _Setup-_ and _Teardown-_functions that are executed bevore and after the execution of every _Testcase_ of a _Testsuite_. Can be helpful if the same preparation/cleanup steps are required for each test.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-5-setup-teardown/sample-1-test.txt)      
robot --outputdir ./report sample-1-test.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-1-test.txt

----------------------------------------------------------------------------------------------------------------

Finally some testcases might need specific preparation/cleanup functionality that is not part of the test itsself. This can be achieved as follows.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-5-setup-teardown/sample-2-testcase.txt)      
robot --outputdir ./report sample-2-testcase.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-2-testcase.txt

[top](#toc)

<a name="sample-6-parameter"></a>
## sample-6-parameter

Sometimes it might make sense to have _Keywords_ that can work with a lot of parameters. For example all the parameters that might be processed in a form of a web application. Using the "..."-syntax it is possible to split paramters to one _Keyword_ to sevaral lines and thus increase readability.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-6-parameter/sample-0-parameters-divided.txt)      
robot --outputdir ./report sample-0-parameters-divided.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-parameters-divided.txt

[top](#toc)

<a name="sample-7-conditional-execution"></a>
## sample-7-conditional-execution

This example shows how to execute a _Keyword_ set as a variable. This way it is for example possible to stear which
keyword to use for certain actions by overwriting this variable using a variable file or command line option. (Might be useful if the same keyword cannot be used locally and in some test environment.)

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-7-conditional-execution/sample-0-keyword-in-variable.txt)      
robot --outputdir ./report sample-0-keyword-in-variable.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-keyword-in-variable.txt

__Test execution with different logging keyword__
robot --outputdir ./report --variable MY_LOGGING_KEYWORD:Log_Many -E space:_ sample-0-keyword-in-variable.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report --variable MY_LOGGING_KEYWORD:Log_Many -E space:_ sample-0-keyword-in-variable.txt

----------------------------------------------------------------------------------------------------------------

This example shows how to run a _Keyword_ based on a condition (aka some value in some variable). Use with care as it might make tests hard to understand and troubleshoot if they are failing.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-7-conditional-execution/sample-1-run-keyword-if.txt)      
robot --outputdir ./report sample-1-run-keyword-if.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-1-run-keyword-if.txt

----------------------------------------------------------------------------------------------------------------

The following shows how to run a _Keyword_ and ignore any errors it produces. Might be useful when using temporary sometimes or maybe when addressing an external system during testing that provides a kind of "nice-to-have" feature.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-7-conditional-execution/sample-2-ignore-error.txt)      
robot --outputdir ./report sample-2-ignore-error.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-2-ignore-error.txt

[top](#toc)

<a name="sample-8-database"></a>
## sample-8-database

__Note:__ This example differs from the previous examples of this tutorial, as it requires a database to be setup and running. In this case PostgreSQL is used with an example that is described here: [https://github.com/ThomasJaspers/db_liquibase_sample](https://github.com/ThomasJaspers/db_liquibase_sample) 

The example can of course be easily changed to user another database and other tables by replacing the JDBC-driver and adepting the tests.

The documentation for the Database Library is part of this tutorial and can be found here: [https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-8-database/doc/DatabaseLibrary_v20.html](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-8-database/doc/DatabaseLibrary_v20.html)

----------------------------------------------------------------------------------------------------------------

This example shows the usage of the [Java Database Library](https://github.com/ThomasJaspers/robotframework-dblibrary) for the Robot Framework. Please note that execution via __robot__ is not possible, but the next example shows the usage of the Database Library as a Remote Library. Then __robot__ can be used again.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-8-database/sample-0-database.txt)      

java -cp '/usr/local/opt/robotframework/robotframework-2.9.2.jar:./lib/dblibrary-2.0.jar:./lib/postgresql-9.3-1102-jdbc41.jar' org.robotframework.RobotFramework --outputdir ./report sample-0-database.txt

----------------------------------------------------------------------------------------------------------------

To execute the example using the Remote Library support of the Database Library the server needs to be started first. Afterwards the tests can be executed.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-8-database/sample-1-database-remotelib.txt)

java -cp './server/dblibrary-2.0-server.jar:./lib/postgresql-9.3-1102-jdbc41.jar' org.robot.database.server.RemoteServer --port 8270

robot --outputdir ./report sample-1-database-remotelib.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-1-database-remotelib.txt

[top](#toc)

<a name="sample-9-file-processing"></a>
## sample-9-file-processing

This example shows how to do some more complex file processing using the Robot Framework. It starts with a small example and the continues by extending this example. Please take also a look at the [corresponding blog post for more information](https://blog.codecentric.de/en/2016/07/robot-framework-tutorial-2016-file-processing/).

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-9-file-processing/sample-9-reading-text-file.txt)      
robot --outputdir ./report sample-9-reading-text-file.txt  
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-9-reading-text-file.txt

----------------------------------------------------------------------------------------------------------------

Added first processing step to the example.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-9-file-processing/sample-9-processing-text-file-1.txt)      
robot --outputdir ./report sample-9-processing-text-file-1.txt    
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-9-processing-text-file-1.txt  

----------------------------------------------------------------------------------------------------------------

Added second processing step to the example.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-9-file-processing/sample-9-processing-text-file-2.txt)      
robot --outputdir ./report sample-9-processing-text-file-1.txt    
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-9-processing-text-file-1.txt  

[top](#toc)

<a name="sample-10-collections"></a>
## sample-10-collections

This example shows some basic usage of the Robot Framework Collections-library Please take also a look at the [corresponding blog post for more information](https://blog.codecentric.de/en/2016/12/robot-framework-tutorial-2016-working-with-collections/).

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-10-collections/sample-0-simple-list.txt)      
robot --outputdir ./report sample-0-simple-list.txt   
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-0-simple-list.txt   

----------------------------------------------------------------------------------------------------------------

Some more advanced examples for working with Lists.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-10-collections/sample-1-complex-list.txt)      
robot --outputdir ./report sample-1-complex-list.txt    
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-1-complex-list.txt   

----------------------------------------------------------------------------------------------------------------

Add some examples how to work with dictionaries.

__Test execution__  | [VIEW FILE](https://github.com/ThomasJaspers/robot-keyword-tutorial/blob/master/sample-10-collections/sample-2-dictionary.txt)      
robot --outputdir ./report sample-2-dictionary.txt   
java -jar /usr/local/opt/robotframework/robotframework-2.9.2.jar --outputdir ./report sample-2-dictionary.txt   

[top](#toc)

