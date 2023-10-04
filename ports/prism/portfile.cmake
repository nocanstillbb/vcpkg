#vcpkg_from_git(
#    OUT_SOURCE_PATH SOURCE_PATH
#    URL https://github.com/nocanstillbb/prism.git
#    REF 59fc49ca76338364c6351475a4ad5d80578f625
#)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO nocanstillbb/prism
    REF 48ba3101e668878cab2a5f56e13b238d4f7ea5eb
  SHA512 fafea7e4ad8746f7edaca80bc78119198bffa47c0ff57e4caebb0d53b891f52c2e812dca0f030470494901c46d21e3473e38e37e2dd9be86b9d59bc66e4445bf
  HEAD_REF master
)


vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
file(
  INSTALL "${SOURCE_PATH}/usage"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

#execute_process(COMMAND ${CMAKE_COMMAND} -E echo "
#----------
##----------" )

