vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO liyk123/TwoBot
    REF "e4530c2b3a00b8bc0a85f9b61ebcf80935aed1fe"
    SHA512 20a0026ec7b9fef9c2224a58b3d505d675f68ae57965dda00c53d5dbfdd6d6e0ea181d8a308127ad57b4880f5b2d476a56482d4d45659e4263a413d0cd302701 # This is a temporary value. We will modify this value in the next section.
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