include(../config.pri)

TEMPLATE = app
TARGET = $$MALIIT_SERVER
target.path = $$M_IM_INSTALL_BIN
DEPENDPATH += .
INCLUDEPATH += . .. ../src ../common ../connection

LIBS += ../connection/libmaliit-connection.a
POST_TARGETDEPS += ../connection/libmaliit-connection.a

# FIXME: a better way to get this info from connection
CONFIG += link_pkgconfig
PKGCONFIG += glib-2.0
PKGCONFIG += dbus-glib-1 gio-2.0
CONFIG += qdbus
# needs to match

LIBS += ../src/lib$${MALIIT_PLUGINS_LIB}.so
x11:LIBS += -lXfixes

SOURCES += main.cpp

QT += core $$QT_WIDGETS

# coverage flags are off per default, but can be turned on via qmake COV_OPTION=on
for(OPTION,$$list($$lower($$COV_OPTION))){
    isEqual(OPTION, on){
        QMAKE_CXXFLAGS += -ftest-coverage -fprofile-arcs -fno-elide-constructors
        LIBS += -lgcov
    }
}

QMAKE_CLEAN += *.gcno *.gcda

INSTALLS += target


QMAKE_EXTRA_TARGETS += check-xml
check-xml.target = check-xml
check-xml.depends += $$TARGET

QMAKE_EXTRA_TARGETS += check
check.target = check
check.depends += $$TARGET

system(dpkg-architecture -ei386):SOFTWARE="-software -bypass-wm-hint "
message(Argument added to im server: $$SOFTWARE $$TARGETDEVICE)

