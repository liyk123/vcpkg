vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO liyk123/TwoBot
    REF "04eccf0f81e754a8f2ef1f9ecaea39663fa7cdec"
    SHA512 a1a7390760eb54aac1dcbd5782ad9afd63af973763549f424d57a2ed1e216334d45ee168f3ccd361e716ac0c46ae1b04afb3d834a261e308bd4d8004c6ef7868 # This is a temporary value. We will modify this value in the next section.
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