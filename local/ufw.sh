#!/usr/bin/env bash

_ufw_internal() {
	local cmd="$1"
	shift
	local args="$@"

	belt_remote_exec <<-SCRIPT
		source /tmp/belt/env.sh
		source "$_BELT_PLUGINS_PATH/lib/ufw.sh"
	SCRIPT
}

ufw_install() {
	_ufw_internal "${FUNCNAME[0]}"
}

ufw_create_policies() {
	_ufw_internal "${FUNCNAME[0]}"
}

ufw_allow() {
	_ufw_internal "${FUNCNAME[0]}" "$@"
}

ufw_exec() {
	_ufw_internal "${FUNCNAME[0]}" "$@"
}

ufw_enable() {
	_ufw_internal "${FUNCNAME[0]}"
}
