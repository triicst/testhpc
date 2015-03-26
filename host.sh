#!/bin/bash
 
PROCCOUNT=`ps -Afl | wc -l`
PROCCOUNT=`expr $PROCCOUNT - 5`
GROUPZ=`groups`
 
if [[ $GROUPZ == *irc* ]]; then
ENDSESSION=`cat /etc/security/limits.conf | grep "@irc" | grep maxlogins | awk {'print $4'}`
PRIVLAGED="IRC Account"
else
ENDSESSION="Unlimited"
PRIVLAGED="Regular User"
fi
 
echo -e "\033[1;32m _ _
| (_)
| |_ _ __  _   ___  ____      ____ _ _ __ ____
| | | '_ | | |  / /  / / / _\` | '__|_  /
| | | | | | |_| |>  <   V  V / (_| | |   / /
|_|_|_| |_|__,_/_/_  _/_/ __,_|_|  /___| .com
 
\033[0;35m+++++++++++++++++: \033[0;37mSystem Data\033[0;35m :+++++++++++++++++++
+  \033[0;37mHostname \033[0;35m= \033[1;32m`hostname`
\033[0;35m+   \033[0;37mAddress \033[0;35m= \033[1;32m204.93.222.167
\033[0;35m+    \033[0;37mKernel \033[0;35m= \033[1;32m`uname -r`
\033[0;35m+    \033[0;37mUptime \033[0;35m= \033[1;32m`uptime | sed 's/.*up ([^,]*), .*/1/'`
\033[0;35m+       \033[0;37mCPU \033[0;35m= \033[1;32m4x Intel(R) Xeon(R) E5620 @ 2.40GHz
\033[0;35m+    \033[0;37mMemory \033[0;35m= \033[1;32m`cat /proc/meminfo | grep MemTotal | awk {'print $2'}` kB
\033[0;35m++++++++++++++++++: \033[0;37mUser Data\033[0;35m :++++++++++++++++++++
+  \033[0;37mUsername \033[0;35m= \033[1;32m`whoami`
\033[0;35m+ \033[0;37mPrivlages \033[0;35m= \033[1;32m$PRIVLAGED
\033[0;35m+  \033[0;37mSessions \033[0;35m= \033[1;32m`who | grep $USER | wc -l` of $ENDSESSION MAX
\033[0;35m+ \033[0;37mProcesses \033[0;35m= \033[1;32m$PROCCOUNT of `ulimit -u` MAX
\033[0;35m+++++++++++++: \033[0;37mHelpful Information\033[0;35m :+++++++++++++++
+    \033[0;37mvhosts \033[0;35m= \033[1;32mList valid RDNS on IPv6 subnet
\033[0;35m+     \033[0;37mirssi \033[0;35m= \033[1;32mIRC client, -h to use vhosts
\033[0;35m+ \033[0;37mBox Admin \033[0;35m= \033[1;32mLinuxwarz @ EFnet
\033[0;35m+++++++++++: \033[0;31mMaintenance Information\033[0;35m :+++++++++++++
+\033[0;31m `cat /etc/motd-maint`
\033[0;35m+++++++++++++++++++++++++++++++++++++++++++++++++++
"
