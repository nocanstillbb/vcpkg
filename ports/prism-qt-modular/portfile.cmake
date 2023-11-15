vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL http://git1.deepvision-tech.net/PACKAGES/prism_qt_modular.git
  REF db8a0bc4c0628e813a876ddbd4799b1ae566a005
  HEAD_REF master
)

string(REPLACE "-" "_" PORT "${PORT}")

#https://learn.microsoft.com/en-us/vcpkg/examples/packaging-github-repos
vcpkg_cmake_configure( SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()


vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

file(
    INSTALL "${SOURCE_PATH}/usage"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")




