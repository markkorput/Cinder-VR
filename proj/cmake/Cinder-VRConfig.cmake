if( NOT TARGET Cinder-VR )
	get_filename_component( local_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )
	get_filename_component( local_INCLUDE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../include" ABSOLUTE )
	get_filename_component( local_EXT_PATH "${CMAKE_CURRENT_LIST_DIR}/../../ext" ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	FILE(GLOB local_SOURCES ${local_SOURCE_PATH}/cinder/vr/*.cpp ${local_SOURCE_PATH}/cinder/vr/**/*.cpp ${local_EXT_PATH}/LibOVR/Src/*.c*)

	add_library( Cinder-VR ${local_SOURCES} )

	target_include_directories( Cinder-VR PUBLIC "${local_INCLUDE_PATH}")
	target_include_directories( Cinder-VR PUBLIC "${local_EXT_PATH}/OpenVR/headers")
	target_include_directories( Cinder-VR PUBLIC "${local_EXT_PATH}/LibOVR/Include")
	target_include_directories( Cinder-VR SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
	target_link_libraries( Cinder-VR PRIVATE cinder )
endif()
