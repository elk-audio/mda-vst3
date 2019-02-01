# Stripped down version of Steinberg's global CMakeLists.txt,
# which allows plugins to be build outside of Steinberg's VST3 SDK project.

if(VST3_SDK_ROOT)
    message(STATUS "VST3_SDK_ROOT=${VST3_SDK_ROOT}")
else()
    message(FATAL_ERROR "VST3_SDK_ROOT is not defined. Please use -DVST3_SDK_ROOT=<path to VST3 sdk>.")
endif()

list(APPEND CMAKE_MODULE_PATH "${VST3_SDK_ROOT}/cmake/modules")

include(Global)
include(AddVST3Library)
include(Bundle)
include(ExportedSymbols)
include(PrefixHeader)

include_directories(${VST3_SDK_ROOT})

set(VST_SDK TRUE)
set(SDK_ROOT ${VST3_SDK_ROOT})
set(public_sdk_SOURCE_DIR ${SDK_ROOT}/public.sdk)
set(pluginterfaces_SOURCE_DIR ${SDK_ROOT}/pluginterfaces)

set(SDK_IDE_LIBS_FOLDER FOLDER "Libraries")
set(SDK_IDE_HOSTING_EXAMPLES_FOLDER FOLDER "HostingExamples")
set(WARNINGS_DISABLED "-w")
if(NOT IS_ABSOLUTE ${SMTG_COREAUDIO_SDK_PATH})
    get_filename_component(SMTG_COREAUDIO_SDK_PATH "${SDK_ROOT}/${SMTG_COREAUDIO_SDK_PATH}" ABSOLUTE)
endif()
set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-multichar")
link_libraries(pthread dl)

add_subdirectory(${VST3_SDK_ROOT}/base)
add_subdirectory(${VST3_SDK_ROOT}/public.sdk)
set_target_properties(sdk PROPERTIES ${SDK_IDE_LIBS_FOLDER})
set_target_properties(sdk PROPERTIES COMPILE_FLAGS ${WARNINGS_DISABLED})
set_target_properties(base PROPERTIES COMPILE_FLAGS ${WARNINGS_DISABLED})
