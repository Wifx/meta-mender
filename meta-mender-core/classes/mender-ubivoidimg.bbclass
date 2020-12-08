# Class to create the "dataimg" type, which contains the data partition as a raw
# filesystem.

IMAGE_CMD_ubivoidimg() {
    mkdir -p "${WORKDIR}/ubivoidimg"
    mkfs.ubifs -o "${WORKDIR}/ubivoidimg.ubifs" -r "${WORKDIR}/ubivoidimg" ${MKUBIFS_ARGS}
    rmdir "${WORKDIR}/ubivoidimg"
    install -m 0644 "${WORKDIR}/ubivoidimg.ubifs" "${IMGDEPLOYDIR}/${IMAGE_NAME}.ubivoidimg"
}

do_image_ubivoidimg[depends] += "${@bb.utils.contains('DISTRO_FEATURES', 'mender-image-ubi', 'mtd-utils-native:do_populate_sysroot', '', d)}"
