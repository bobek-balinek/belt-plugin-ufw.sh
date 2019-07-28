#!/usr/bin/env bash

ufw_install() {
	if command_exists "ufw"; then
		return 0
	fi

	apt update &>/dev/null || abort "apt update failed"

	apt install --yes ufw &>/dev/null || abort "ufw apt install failed"
}

ufw_create_policies() {
	ufw default deny incoming
	ufw default allow outgoing
}

ufw_exec() {
	local cmd="$1"
	ufw "$cmd"
}

ufw_allow() {
	local cmd="$1"
	ufw allow "$cmd"
}

ufw_disallow() {
	local cmd="$1"
	ufw disallow "$cmd"
}

ufw_enable() {
	ufw enable
}

ufw_disable() {
	ufw disable
}
