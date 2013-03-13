/* * This file is part of Maliit framework *
 *
 * Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
 * All rights reserved.
 *
 * Contact: maliit-discuss@lists.maliit.org
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation
 * and appearing in the file LICENSE.LGPL included in the packaging
 * of this file.
 */

#include "mimpluginsproxywidget.h"
#include "mimserveroptions.h"

#include <QApplication>
#include <QDesktopWidget>

MImPluginsProxyWidget::MImPluginsProxyWidget(QWidget *parent) :
    QWidget(parent)
{
    setWindowFlags(Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint);
    setAttribute(Qt::WA_X11DoNotAcceptFocus);
    setAutoFillBackground(false);
    setBackgroundRole(QPalette::NoRole);

    // X11-specific initialization is performed in MImXApplication()
    setAttribute(Qt::WA_TranslucentBackground);
    setSizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    QDesktopWidget* desktop = QApplication::desktop();
    setMinimumSize(desktop->screenGeometry().size());
}
