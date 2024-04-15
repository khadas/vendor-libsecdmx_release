LOCAL_PATH := $(call my-dir)

ifeq ($(wildcard $(LOCAL_PATH)/../demux),)

include $(CLEAR_VARS)
LOCAL_MODULE := libdmx_client
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_SHARED_LIBRARIES := liblog libteec
LOCAL_PROPRIETARY_MODULE := true
ifeq ($(PLATFORM_TDK_VERSION), 318)
LOCAL_SRC_FILES_32 := lib32/318/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
else
LOCAL_SRC_FILES_32 := lib32/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
endif
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libdmx_client_sys
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_SHARED_LIBRARIES := liblog libteec_sys
LOCAL_SRC_FILES_32 := lib32/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := b472711b-3ada-4c37-8c2a-7c64d8af0223
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_MULTILIB := 32
LOCAL_MODULE_SUFFIX := .ta
LOCAL_STRIP_MODULE := false
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/teetz
ifeq ($(filter S805X2 S805C3 S905C2 S905C2L S905C3 S905C3ENG S905X4 S905Y4 T962D4 S905Y5ENG S905X5M S905X5MENG, $(BOARD_AML_SOC_TYPE)),)
    LOCAL_SRC_FILES_32 := ta/v3.8/dev/common/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
else
    ifeq ($(filter S905Y5ENG S905X5M S905X5MENG, $(BOARD_AML_SOC_TYPE)),)
    LOCAL_SRC_FILES_32 := ta/v3.8/dev/$(BOARD_AML_SOC_TYPE)/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
    else
    LOCAL_SRC_FILES_32 := ta/v3.18.0-64bit/dev/$(BOARD_AML_SOC_TYPE)/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
    endif
endif
include $(BUILD_PREBUILT)
endif
