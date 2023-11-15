vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL http://git1.deepvision-tech.net/PACKAGES/rc_genicam_api.git
  REF 3c6e11cf2779dcece9360da7f15060054deddb75
  HEAD_REF master
)



#https://learn.microsoft.com/en-us/vcpkg/examples/packaging-github-repos
vcpkg_cmake_configure( SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()


vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
    INSTALL "${SOURCE_PATH}/usage"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

