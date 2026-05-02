include $(TOPDIR)/rules.mk

PKG_NAME:=podman-containers
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

PKG_LICENSE:=Apache-2.0
PKG_MAINTAINER:=Julian Rossbach <contact@juffma.de>

include $(INCLUDE_DIR)/package.mk

define Package/podman-containers
  SECTION:=utils
  CATEGORY:=I
  SUBMENU:=Podman
  URL:=https://github.com/Juff-Ma/openwrt-containers
  TITLE:=Podman Containers
  DEPENDS:=+podman-service
endef

define Package/podman-containers/description
  Podman Containers: Container startup service for Podman
endef

define Package/podman-containers/conffiles
/etc/config/podman
endef

define Build/Configure
  true
endef

define Build/Prepare
  true
endef

define Build/Compile
  true
endef

define Package/podman-containers/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/podman.conf $(1)/etc/config/podman

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/containers.init $(1)/etc/init.d/containers
endef

$(eval $(call BuildPackage,podman-containers))
