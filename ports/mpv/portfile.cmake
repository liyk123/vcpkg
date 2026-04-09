vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mpv-player/mpv
    REF "v${VERSION}"
    SHA512 d8806ef04455aeb65d45c5956b4589d7a9728f869b74b9bcd8c9ab08475c28538334399ddc7fc2aee6a31fd178fe4b87ec755cd99ffa6e29ab4b6b61757b9320
    HEAD_REF master
)

vcpkg_configure_meson(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -Dtests=false
        -Dmanpage-build=disabled
        -Diconv=disabled
        -Dlua=disabled
        -Dcplayer=false
        -Dlibmpv=true
)

vcpkg_install_meson()

vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(INSTALL "${SOURCE_PATH}/Copyright" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
