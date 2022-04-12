
include $(TOPDIR)/rules.mk


PKG_NAME:=ZXing
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION).$(PKG_RELEASE)
PKG_SOURCE_VERSION:=6af999d4248592b7d73c1acecbe687baf2bd0990
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk


define Package/ZXing
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Helloworld -- prints a snarky message
  DEPENDS:=+libstdcpp
endef

define Package/ZXing/description
  If you can't figure out what this program does, you're probably
  brain-dead and need immediate medical attention.
endef


define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
        $(CP) ./src/* $(PKG_BUILD_DIR)/
endef


define Package/ZXing/install
        $(INSTALL_DIR) $(1)/bin
        $(INSTALL_DIR) $(1)/usr/lib
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/example/ZXingReader $(1)/bin/
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/core/libZXing.so* $(1)/usr/lib
endef


$(eval $(call BuildPackage,$(PKG_NAME)))
