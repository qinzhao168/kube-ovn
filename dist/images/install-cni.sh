#!/bin/sh

set -u -e

exit_with_error(){
  echo $1
  exit 1
}

CNI_BIN_SRC=/kube-ovn/kube-ovn
CNI_BIN_DST=/opt/cni/bin/kube-ovn

CNI_CONF_SRC=/kube-ovn/kube-ovn.conflist
CNI_CONF_DST=/etc/cni/net.d/kube-ovn.conflist

LOOPBACK_BIN_SRC=/loopback
LOOPBACK_BIN_DST=/opt/cni/bin/loopback

yes | cp -f $LOOPBACK_BIN_SRC $LOOPBACK_BIN_DST || exit_with_error "Failed to copy $LOOPBACK_BIN_SRC to $LOOPBACK_BIN_DST"
yes | cp -f $CNI_BIN_SRC $CNI_BIN_DST || exit_with_error "Failed to copy $CNI_BIN_SRC to $CNI_BIN_DST"
yes | cp -f $CNI_CONF_SRC $CNI_CONF_DST || exit_with_error "Failed to copy $CNI_CONF_SRC to $CNI_CONF_DST"
