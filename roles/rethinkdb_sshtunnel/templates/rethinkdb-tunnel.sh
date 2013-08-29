#!/bin/bash
#
# rethinkdb-autosshd This script starts and stops the autossh daemon for rethinkdb tunnels
#
# chkconfig: 2345 95 15
# processname: rethinkdb-autosshd
# description: rethinkdb-autosshd is the autossh daemon for rethinkdb tunnels.

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ ${NETWORKING} = "no" ] && exit 0

export AUTOSSH_PIDFILE="/var/run/autossh.pid"

# By default it's all good.
RETVAL=0

# Start function.
start() {
    local name=$1
    echo -n $"Starting ${name}: "
    if [ -e "/var/lock/subsys/${name}" ]; then
        if [ -e "/var/run/${name}.pid" ] && [ -e /proc/`cat /var/run/${name}.pid` ]; then
            echo -n $"already exists.";
            failure $"already exists.";
            echo
            return 1
        fi
    fi
    daemon /usr/bin/autossh -M 0 -f -nNT -F ${TUNNEL_SSHCONFIG} -i ${TUNNEL_IDENTITY} ${TUNNEL_HOST}
    RETVAL=$?
    [ $RETVAL -eq 0 ] && touch "/var/lock/subsys/${name}"
    echo
    return $RETVAL
}

# Stop function.
stop() {
    local name=$1
    echo -n $"Stopping ${name}: "
    killproc -p "/var/run/${name}.pid" ${name}
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && rm -f "/var/lock/subsys/${name}"
    return $RETVAL
}

# See how we were called.
case "$1" in
    start)
        start "autossh"
        ;;
    stop)
        stop "autossh"
        ;;
    restart)
        $0 stop
        sleep 3
        $0 start
        ;;
    status)
        status "autossh"
        RETVAL=$?
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac

exit $RETVAL