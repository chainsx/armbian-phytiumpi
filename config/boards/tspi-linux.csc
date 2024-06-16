# Rockchip RK3566 quad core 1GB-2GB GBE eMMC NVMe USB3 WiFi
BOARD_NAME="Taishan Pi"
BOARDFAMILY="rk35xx"
BOARD_MAINTAINER=""
BOOTCONFIG="firefly-m2-rk3568_defconfig"
KERNEL_TARGET="legacy"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/tspi-rk3566-user-v10-linux.dtb"
SRC_EXTLINUX="yes"
SRC_CMDLINE="earlycon=uart8250,mmio32,0xfe660000 console=ttyFIQ0"
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
	KERNELSOURCE='https://github.com/chainsx/kernel-tspi.git'
	KERNELBRANCH='branch:main'
	LINUXCONFIG="linux-tspi-${BRANCH}"
}
