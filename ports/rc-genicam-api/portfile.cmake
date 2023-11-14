vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO http://git1.deepvision-tech.net/PACKAGES/rc_genicam_api
    REF c453baf83a7237b011347facb731b9354697a321
  HEAD_REF master
)


#https://learn.microsoft.com/en-us/vcpkg/examples/packaging-github-repos
vcpkg_cmake_configure( SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()


vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(
    INSTALL "${SOURCE_PATH}/usage"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
