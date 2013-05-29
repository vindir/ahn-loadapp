Basic Usage Overview
--------------------

- Set up adhearsion to point to an asterisk instance with the usual punchblock config settings
- Move to the base ahn-loadapp directory
- bundle install
- bundle exec ahn daemon --pid-file log/adhearsion.pid

- Open two windows for executing.  

```
Window 1:
cc=0
cc=`expr 5 + $cc` && script/cputrack.sh log/`hostname -s`-$cc.stats
```

```
Window 2:
cc=0
cc=`expr 5 + $cc` && sudo LD_LIBRARY_PATH=./extras/centos-63/sipp-centos-63 -i local.ip.address -sf scenario1.xml -l $cc -m $cc -r 5 -p 8835 -trace_err asterisk.ip.address
```

- Cputrack should be ctrl-c killed after each sipp run.
- Clean up your .stats data to pull out 0% idle entries from before and after the sipp run.
- Execute script/stats.rb against the resulting .stats files to get basic statistics from the load tests logging.

