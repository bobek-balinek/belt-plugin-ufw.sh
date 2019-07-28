#!/usr/bin/env bash
set -eo pipefail

source /dev/stdin <<< "$(curl -Lsm 2 https://get.belt.sh)"
source "./plugins.sh"

main() {
	local host="$1"

	[[ -z "$host" ]] && echo "Error: missing argument host" && exit 1

	belt_load_plugins "./"

	belt_begin_session "root" "$host"

	echo "Uploading Belt plugins…"
	belt_upload_plugins "./"

	echo "Installing UFW..."
	ufw_install

	echo "Setting default access policy"
	ufw_create_policies

	echo "Configuring SSH access…"
	ufw_allow 22

	echo "Enabling HTTP access…"
	ufw_allow 80

	echo "Enabling HTTPS access…"
	ufw_allow 443

	echo "Starting UFW…"
	ufw_enable
}

echo "Provisioning UFW..."
main "$1"
