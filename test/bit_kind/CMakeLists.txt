project (BIT_KIND)
enable_language (Fortran)

add_definitions(-DFORK_USE_BIT_KIND=1)

set (EXAMPLE_EXE_NAME bitkindtest)
set (EXAMPLE_EXE_SOURCE test.F90)
set_source_files_properties(${EXAMPLE_EXE_SOURCE} PROPERTIES COMPILE_FLAGS "${F90_FLAGS}")

add_executable (${EXAMPLE_EXE_NAME} ${EXAMPLE_EXE_SOURCE} ${FORK_SOURCE_DIR}/fork_m.F90)

set_target_properties(${EXAMPLE_EXE_NAME}
                      PROPERTIES OUTPUT_NAME ${EXAMPLE_EXE_NAME}
                      RUNTIME_OUTPUT_DIRECTORY ${FORK_BUILD_DIR}/bin)
