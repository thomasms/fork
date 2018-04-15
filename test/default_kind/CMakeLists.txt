project (DEFAULT_KIND)
enable_language (Fortran)

set (EXAMPLE_EXE_NAME defaultkind)
set (EXAMPLE_EXE_SOURCE ${FORK_TEST_DIR}/default_kind/test.F90)
set_source_files_properties(${EXAMPLE_EXE_SOURCE} PROPERTIES COMPILE_FLAGS "${F90_FLAGS}")

add_executable (${EXAMPLE_EXE_NAME} ${EXAMPLE_EXE_SOURCE} ${FORK_SOURCE_DIR}/fork_m.F90)

set_target_properties(${EXAMPLE_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${EXAMPLE_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORK_BUILD_DIR}/bin)
