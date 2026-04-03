vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO haasn/libplacebo
    REF "v${VERSION}"
    SHA512 209b1713cff34f06149af16fb3ea52e3662a566ef5df6b29811ad295aa8cb6388f827a93fc8e0eed1a72f35b3b3aae835520c933079e706a51d11136a8128799
)

x_vcpkg_get_python_packages(
    PYTHON_VERSION 3
    PACKAGES glad2 jinja2
    OUT_PYTHON_VAR PYTHON_ENV
)

vcpkg_configure_meson(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -Dtests=false
        -Dbench=false
        -Ddemos=false
        -Dvulkan=disabled
    ADDITIONAL_BINARIES
        "python=['${PYTHON_ENV}']"
        "python3=['${PYTHON_ENV}']"
)

vcpkg_install_meson()

vcpkg_fixup_pkgconfig()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
