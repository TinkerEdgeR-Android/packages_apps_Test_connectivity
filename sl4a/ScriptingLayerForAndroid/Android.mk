LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := sl4a
LOCAL_MODULE_OWNER := google
LOCAL_DEX_PREOPT := false

LOCAL_CERTIFICATE := platform

LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_AAPT_FLAGS := --auto-add-overlay

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := libGoogleAnalytics:../Common/libs/libGoogleAnalytics.jar

LOCAL_STATIC_JAVA_LIBRARIES := guava android-common libGoogleAnalytics locale_platform android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += sl4a.Utils sl4a.Common
LOCAL_STATIC_JAVA_LIBRARIES += sl4a.InterpreterForAndroid sl4a.ScriptingLayer sl4a.QuickAction

LOCAL_PRIVILEGED_MODULE := true
LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := locale_platform:libs/locale_platform.jar
include $(BUILD_MULTI_PREBUILT)


# only include rules to build other stuff for the original package, not the derived package.
#ifeq ($(strip $(LOCAL_PACKAGE_OVERRIDES)),)
# additionally, build unit tests in a separate .apk
include $(call all-makefiles-under,$(LOCAL_PATH))
#endif