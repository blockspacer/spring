# Downloaded from: http://www-id.imag.fr/FLOWVR/manual/flowvr-suite-src/flowvr-render/cmake/
# License: GPL v2, http://www-id.imag.fr/FLOWVR/manual/flowvr-suite-src/flowvr-render/COPYING

# - Try to find GLEW
# Once done this will define
#
#  GLEW_FOUND - system has GLEW
#  GLEW_INCLUDE_DIR - the GLEW include directory
#  GLEW_LIBRARIES - Link these to use GLEW
#  GLEW_DEFINITIONS - Compiler switches required for using GLEW
#


FIND_PATH(GLEW_INCLUDE_DIR NAMES GL/glew.h
  PATHS
  ${PROJECT_BINARY_DIR}/include
  ${PROJECT_SOURCE_DIR}/include
  ENV CPATH
  /usr/include
  /usr/local/include
  NO_DEFAULT_PATH
)
FIND_PATH(GLEW_INCLUDE_DIR NAMES GL/glew.h)

FIND_LIBRARY(GLEW_LIBRARIES NAMES GLEW
  PATHS
  ${PROJECT_BINARY_DIR}/lib64
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib64
  ${PROJECT_SOURCE_DIR}/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib64
  /usr/lib
  /usr/local/lib64
  /usr/local/lib
  NO_DEFAULT_PATH
)
IF(WIN32)
  FIND_LIBRARY(GLEW_LIBRARIES NAMES GLEW glew32)
ELSE(WIN32)
  FIND_LIBRARY(GLEW_LIBRARIES NAMES GLEW)
ENDIF(WIN32)

IF(GLEW_INCLUDE_DIR AND GLEW_LIBRARIES)
   SET(GLEW_FOUND TRUE)
ENDIF(GLEW_INCLUDE_DIR AND GLEW_LIBRARIES)

IF(GLEW_FOUND)
  IF(NOT GLEW_FIND_QUIETLY)
    MESSAGE(STATUS "Found GLEW: ${GLEW_LIBRARIES}")
  ENDIF(NOT GLEW_FIND_QUIETLY)
ELSE(GLEW_FOUND)
  IF(GLEW_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find GLEW")
  ENDIF(GLEW_FIND_REQUIRED)
ENDIF(GLEW_FOUND)

# show the GLEW_INCLUDE_DIR and GLEW_LIBRARIES variables only in the advanced view
MARK_AS_ADVANCED(GLEW_INCLUDE_DIR GLEW_LIBRARIES )
