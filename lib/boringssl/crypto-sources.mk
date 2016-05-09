LOCAL_ADDITIONAL_DEPENDENCIES += $(BORINGSSL_ROOT)/sources.mk
include $(BORINGSSL_ROOT)/sources.mk

LOCAL_CFLAGS += -I$(BORINGSSL_ROOT)/src/include -I$(BORINGSSL_ROOT)/src/crypto -Wno-unused-parameter -DANDROID
LOCAL_ASFLAGS += -I$(BORINGSSL_ROOT)/src/include -I$(BORINGSSL_ROOT)/src/crypto -Wno-unused-parameter
# Do not add in the architecture-specific files if we don't want to build assembly
ifeq ($(LOCAL_IS_HOST_MODULE),true)
LOCAL_SRC_FILES_linux_x86 := $(linux_x86_sources)
LOCAL_SRC_FILES_linux_x86_64 := $(linux_x86_64_sources)
else
LOCAL_SRC_FILES_x86 := $(linux_x86_sources)
LOCAL_SRC_FILES_x86_64 := $(linux_x86_64_sources)
LOCAL_SRC_FILES_arm := $(linux_arm_sources)
LOCAL_SRC_FILES_arm64 := $(linux_aarch64_sources)
endif
LOCAL_SRC_FILES += $(crypto_sources)
