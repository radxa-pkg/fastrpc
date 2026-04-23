#!/bin/bash

rm -rf /usr/lib/dsp

MAC=$(cat /sys/firmware/devicetree/base/model)

case "$MAC" in
    "Radxa Dragon Q6A")
        ln -sf /usr/share/qcom/qcs6490/radxa/dragon-q6a/dsp /usr/lib/dsp
        ;;
    "Radxa Dragon Q8B")
        ln -sf /usr/share/qcom/sc8280xp/radxa/dragon-q8b/dsp /usr/lib/dsp
        ;;
esac
