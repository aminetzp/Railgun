#!/bin/bash
# ImmortalWrt K2P 定制 - feeds install 之后、编译之前执行
# 老板需求：AP 模式 + ZeroTier
# 写于 2026-10-15

# === 1. 默认 LAN IP 改为 10.15.0.71（您内网专用 AP 静态 IP） ===
#    原 ImmortalWrt 默认 192.168.1.1，AP 模式下需与上级网段一致
sed -i 's/192.168.1.1/10.15.0.71/g' package/base-files/files/bin/config_generate

# === 2. 默认主机名 ===
sed -i 's/OpenWrt/K2P/g' package/base-files/files/bin/config_generate

# === 3. 802.11r (KVR 漫游) 提示 ===
#    ImmortalWrt/OpenWrt 的 802.11r 通过 hostapd 配置，
#    无需改 mt_wifi dat 文件。刷机后请在 LuCI →
#    网络 → 无线 → 编辑 SSID → 勾选 "802.11r Fast Transition" 即可
#    （或编辑 /etc/config/wireless 加 option ieee80211r '1'）
