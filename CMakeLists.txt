# CMake project file for forts
cmake_minimum_required (VERSION 2.8)

# project name and details
project (Fork)
enable_language (Fortran)

set(PROJECT_DESCRIPTION "Fork")
set(PROJECT_URL "https://git.ccfe.ac.uk/thomasms/fork")

# set source directories
set (FORK_SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR})
set (FORK_TEST_DIR ${CMAKE_CURRENT_LIST_DIR}/test)
set (FORK_BUILD_DIR ${CMAKE_BINARY_DIR})
set (FORK_LIB_DIR ${CMAKE_BINARY_DIR}/lib)

# Collect all the mod files into their own include directory
set(FORK_MODULE_DIR ${FORK_BUILD_DIR}/include)

# library names
set (FORK_DEFAULT_LIB_NAME forkdefault)
set (FORK_BYTE_LIB_NAME forkbyte)
set (FORK_BIT_LIB_NAME forkbit)
set (FORK_BYTE_AND_PREC_LIB_NAME forkbyteandprec)
set (FORK_BIT_AND_PREC_LIB_NAME forkbitandprec)
set (FORK_PREC_LIB_NAME forkbitandprec)

# build type
set (CMAKE_BUILD_TYPE Release CACHE STRING "Select which configuration to build.")

# set the general fortran Debug/Release compiler flags
set(FORK_RELEASE_FLAGS "-O3")
set(FORK_DEBUG_FLAGS "-g -O0")

# Fortran OS specific compiler flags
if (CMAKE_Fortran_COMPILER_ID MATCHES MSVC)
    set ( FORK_DEBUG_FLAGS "${FORK_DEBUG_FLAGS} -fp-model")
    set ( FORK_RELEASE_FLAGS  "${FORK_RELEASE_FLAGS} -fp-model" )
elseif (CMAKE_Fortran_COMPILER_ID MATCHES Intel)
    set ( FORK_DEBUG_FLAGS "${FORK_DEBUG_FLAGS} -debug  -CB -CA -CU -std08 -fpp -fp-model source")
    set ( FORK_RELEASE_FLAGS  "${FORK_RELEASE_FLAGS} -std08 -unroll -fpp -fp-model source -diag-disable 8291,8577" )
elseif (CMAKE_Fortran_COMPILER_ID MATCHES GNU)
    set ( FORK_DEBUG_FLAGS "${FORK_DEBUG_FLAGS} -cpp -ffree-form  -ffloat-store -fno-sign-zero -std=f2008 -ffree-line-length-none")
    set ( FORK_RELEASE_FLAGS  "${FORK_RELEASE_FLAGS} -cpp -ffree-form -ffloat-store -fno-sign-zero -std=f2008 -ffree-line-length-none" )
elseif (CMAKE_Fortran_COMPILER_ID MATCHES NAG)
    set ( FORK_DEBUG_FLAGS "${FORK_DEBUG_FLAGS} -fpp -free -float-store -f2008")
    set ( FORK_RELEASE_FLAGS  "${FORK_RELEASE_FLAGS} -fpp -free -float-store -f2008")
else ()
    message(FATAL_ERROR "OS >>> Fortran Compiler not supported!!")
endif ()

# Release or Debug build
if(CMAKE_BUILD_TYPE MATCHES Release)
    message(STATUS "Release build")
    set(F90_FLAGS ${FORK_RELEASE_FLAGS})
elseif(CMAKE_BUILD_TYPE MATCHES Debug)
    message(STATUS "Debug build")
    set(F90_FLAGS ${FORK_DEBUG_FLAGS})
else()
    message(STATUS "Default build (Release)")
    set(F90_FLAGS ${FORK_RELEASE_FLAGS})
endif()

# set the output directories
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)

# set include and link directories
include_directories (${FORK_MODULE_DIR} ${FORK_TEST_DIR})
link_directories (${FORK_LIB_DIR})

# sources
add_subdirectory(${FORK_TEST_DIR}/default_kind)
add_subdirectory(${FORK_TEST_DIR}/byte_kind)
add_subdirectory(${FORK_TEST_DIR}/bit_kind)
