# Rockchip RK3566 quad core 1GB-2GB GBE eMMC NVMe USB3 WiFi
BOARD_NAME="Taishan Pi"
BOARDFAMILY="rk35xx"
BOARD_MAINTAINER=""
BOOTCONFIG="firefly-m2-rk3568_defconfig"
KERNEL_TARGET="legacy"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-tspi-linux.dtb"
SRC_EXTLINUX="yes"
SRC_CMDLINE="console=ttyS02,1500000 console=tty0"
ASOUND_STATE="asound.state.station-m2"
IMAGE_PARTITION_TABLE="gpt"

function post_family_tweaks__tspi() {
    display_alert "$BOARD" "Installing board tweaks" "info"

	cp -R $SRC/packages/blobs/rtl8723bt_fw/* $SDCARD/lib/firmware/rtl_bt/
	cp -R $SRC/packages/blobs/station/firmware/* $SDCARD/lib/firmware/

	return 0
}

# Override family config for this board; let's avoid conditionals in family config.
function post_family_config__tspi_use_vendor() {
	BOOTSOURCE='https://github.com/150balbes/u-boot-rk'
	BOOTBRANCH='branch:rk356x'
	BOOTDIR="u-boot-${BOARD}"
	BOOTPATCHDIR="u-boot-station-p2"
	LINUXCONFIG="linux-tspi-${BRANCH}"
}
