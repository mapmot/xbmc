SET(APP_NAME Kodi)
SET(APP_NAME_LC kodi)
SET(APP_NAME_UC KODI)
SET(APP_VERSION_MAJOR 17)
SET(APP_VERSION_MINOR 1)
IF(NOT KODI_PREFIX)
  SET(KODI_PREFIX /usr/local)
ENDIF()
IF(NOT KODI_INCLUDE_DIR)
  SET(KODI_INCLUDE_DIR /usr/local/include/kodi)
ENDIF()
IF(NOT KODI_LIB_DIR)
  SET(KODI_LIB_DIR /usr/local/lib/kodi)
ENDIF()
IF(NOT WIN32)
  SET(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -std=gnu++11")
ENDIF()
LIST(APPEND CMAKE_MODULE_PATH /usr/local/lib/kodi)

STRING(REPLACE ";" " " ARCH_DEFINES "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
ADD_DEFINITIONS(${ARCH_DEFINES} -DBUILD_KODI_ADDON)

if(NOT CORE_SYSTEM_NAME)
  if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(CORE_SYSTEM_NAME "osx")
  else()
    string(TOLOWER ${CMAKE_SYSTEM_NAME} CORE_SYSTEM_NAME)
  endif()
endif()

include(addon-helpers)
