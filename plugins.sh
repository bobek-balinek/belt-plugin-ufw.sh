#!/usr/bin/env bash

_BELT_PLUGINS_PATH="/tmp/belt-plugins"

belt_load_plugins() {
	local dir="$1"

	for file in "$dir"/local/*.sh; do source "$file"; done
}

belt_cleanup_plugins() {
	belt_remote_exec "rm -rf $_BELT_PLUGINS_PATH"
}

belt_upload_plugins() {
	local dir="$1"

	belt_cleanup_plugins
	belt_remote_upload "$dir/remote" "$_BELT_PLUGINS_PATH"
}
