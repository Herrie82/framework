include(../common_top.pri)

QT += $$QT_WIDGETS

INCLUDEPATH += ../stubs \
               ../dummyimplugin \

SRC_DIR = ../../src

# Input
HEADERS += \
    ft_mimpluginmanager.h \
    ../stubs/mimsettings_stub.h \
    ../stubs/fakegconf.h \
    ../stubs/fakeproperty.h \
    ../stubs/mkeyboardstatetracker_stub.h \

SOURCES += \
    ft_mimpluginmanager.cpp \
    ../stubs/fakegconf.cpp \
    ../stubs/fakeproperty.cpp \

# For MImInputContextConnection pulled in by TestInputMethodHost
include($$TOP_DIR/connection/libmaliit-connection.pri)

CONFIG += plugin qdbus link_pkgconfig

LIBS += \
    $$SRC_DIR/lib$${MALIIT_PLUGINS_LIB}.so \
    -L ../plugins/ \
    -ldummyimplugin \

include(../common_check.pri)
