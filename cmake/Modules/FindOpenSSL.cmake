# - Try to find open ssl
# Once done this will define
#  OPENSSL_FOUND - System has OPENSSL
#  OPENSSL_INCLUDE_DIRS - The OPENSSL include directories
#  OPENSSL_LIBRARIES - The libraries needed to use OPENSSL

FIND_PATH(	OPENSSL_INCLUDE_DIR openssl/ssl.h openssl/err.h
			PATHS
			"$ENV{OPENSSL_INCLUDEDIR}"
)

FIND_LIBRARY(	SSLEAY_LIBRARY 
				NAMES 
				ssleay32MDd ssleay32MD ssleay32 ssleay
				PATHS
				$ENV{OPENSSL_LIBRARYDIR}
)

FIND_LIBRARY(	LIBEAY_LIBRARY 
				NAMES 
				libeay32MDd libeay32MD libeay32 libeay
				PATHS
				$ENV{OPENSSL_LIBRARYDIR}
)

set(OPENSSL_LIBRARY  $ENV{OPENSSL_LIBRARYDIR})
set(OPENSSL_LIBRARIES  ${SSLEAY_LIBRARY} ${LIBEAY_LIBRARY})
set(OPENSSL_INCLUDE_DIRS ${OPENSSL_INCLUDE_DIR})

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(OPENSSL DEFAULT_MSG
  OPENSSL_INCLUDE_DIR
  OPENSSL_LIBRARY)

mark_as_advanced(OPENSSL_INCLUDE_DIR OPENSSL_LIBRARIES)
 