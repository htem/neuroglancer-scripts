SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "/var/local/precomputed/$1" ]; then
	echo "You need to ingest the data first using neuroglancer-scripts"
	exit 1
fi
echo ${SCRIPT_DIR}

cp "${SCRIPT_DIR}/template.conf" ~/${1}.conf

sed -i "s/<INSERT_NAME_HERE>/${1}/g" ~/${1}.conf

sudo mv ~/${1}.conf "/var/local/precomputed/configs/${1}.conf"

