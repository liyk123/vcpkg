vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO liyk123/TwoBot
    REF "fe438a327d92ddee6c06f1fab9b660625b9cf304"
    SHA512 2ada749e1f4cb7906cada9a227b221ace6270c5a195705ebc66b86fc391d3c0ac5b2fd41ff74a9222a6aa7f5f370111e0ba551753f3f45ce6b55ddc085fb4063
    HEAD_REF dev
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME "${PORT}"
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")