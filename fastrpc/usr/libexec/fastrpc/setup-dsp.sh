#!/bin/bash

rm -rf /usr/lib/dsp

MAC=$(cat /sys/firmware/devicetree/base/model)

case "$MAC" in
    "Radxa CM-Q64"*)
        ln -sf /usr/share/qcom/qcs6490/radxa/cm-q64/dsp /usr/lib/dsp
        ;;
    "Radxa Dragon Q6A")
        ln -sf /usr/share/qcom/qcs6490/radxa/dragon-q6a/dsp /usr/lib/dsp
        ;;
    "Radxa Dragon Q8B")
        ln -sf /usr/share/qcom/sc8280xp/radxa/dragon-q8b/dsp /usr/lib/dsp
        SOC=460
        if [[ ! -f /tmp/fake-soc0/soc_id ]]; then
            mkdir -p /tmp/fake-soc0
            echo "$SOC" > /tmp/fake-soc0/soc_id
            mount --bind /tmp/fake-soc0/soc_id /sys/devices/soc0/soc_id
        fi
        ;;
    "Radxa AIRbox Q900")
        ln -sf /usr/share/qcom/qcs9075/radxa/airbox-q900/dsp /usr/lib/dsp
        ;;
    "Radxa VMARC-Q9075 IO")
        ln -sf /usr/share/qcom/qcs9075/radxa/vmarc-q9075-io/dsp /usr/lib/dsp
        ;;
    *)
        echo "Unsupported board: $MAC"
        ;;
esac
