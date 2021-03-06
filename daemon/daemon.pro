TARGET = harbour-owncloud-daemon

CONFIG = qt c++11
QT = dbus network xml
DEFINES += QWEBDAVITEM_EXTENDED_PROPERTIES

SOURCES += main.cpp \
    uploader.cpp \
    filesystem.cpp \
    ../common/src/settings.cpp \
    uploadentry.cpp \
    networkmonitor.cpp \
    dbushandler.cpp

HEADERS += \
    filesystem.h \
    uploader.h \
    ../common/src/settings.h \
    uploadentry.h \
    networkmonitor.h \
    dbushandler.h

OTHER_FILES += harbour-owncloud-daemon.service

LIBS += $$OUT_PWD/../qwebdavlib/qwebdavlib/libqwebdav.so.1

QMAKE_RPATHDIR += /usr/share/harbour-owncloud/lib

service.path = /usr/lib/systemd/user/
service.files += harbour-owncloud-daemon.service
binary.path = /usr/bin/
binary.files += $$OUT_PWD/harbour-owncloud-daemon

INSTALLS += service binary

INCLUDEPATH += $$PWD/../common/src
DEPENDPATH += $$PWD/../common/src

INCLUDEPATH += $$PWD/../qwebdavlib/qwebdavlib
DEPENDPATH += $$PWD/../qwebdavlib/qwebdavlib
