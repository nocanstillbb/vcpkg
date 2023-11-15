vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL http://git1.deepvision-tech.net/PACKAGES/prism_container.git
  REF 358b017100b1bdbef68b8c51bfbeec1aa7297a46
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



# 设置 spdx 文件的输出路径
set(SPDX_OUTPUT_PATH "${CURRENT_PACKAGES_DIR}/share/${PORT}")
install(FILES ${CMAKE_CURRENT_LIST_DIR}/vcpkg.spdx.json DESTINATION ${SPDX_OUTPUT_PATH})
# 设置 ABI 文件的输出路径
set(ABI_OUTPUT_PATH "${CURRENT_PACKAGES_DIR}/share/${PORT}")
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/vcpkg_abi_info.txt DESTINATION ${ABI_OUTPUT_PATH})

