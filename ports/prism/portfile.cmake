vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL http://git1.deepvision-tech.net/PACKAGES/prism.git
  REF 48bc3a22e07b304da4de312c1658319704959174
  HEAD_REF master
)



#https://learn.microsoft.com/en-us/vcpkg/examples/packaging-github-repos
vcpkg_cmake_configure( SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()


vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

file(
    INSTALL "${SOURCE_PATH}/usage"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

