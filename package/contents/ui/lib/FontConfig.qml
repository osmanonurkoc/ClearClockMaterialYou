/*
    SPDX-FileCopyrightText: 2022 qewer33
    SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick 2.4
import QtQuick.Controls 2.12 as QtControls
import QtQuick.Layouts 1.12 as QtLayouts
import QtQuick.Dialogs

import org.kde.kirigami 2.3 as Kirigami

import "."

QtLayouts.RowLayout {

    property var fontModel

    property color colorValue
    property string fontValue
    property bool boldValue
    property bool italicValue
    property int pxSizeValue


    QtControls.Label {
        text: i18n("Font style:")
        opacity: if (enabled) 1
                 else 0.4
    }

    ColorButton {
        id: fontColorButton
        value: colorValue

        onValueChanged: {
            colorValue = value
        }
    }

    QtControls.ComboBox {
        id: fontFamilyComboBox
        QtLayouts.Layout.fillWidth: true
        QtLayouts.Layout.minimumWidth: Kirigami.Units.gridUnit * 10
        model: fontModel
        textRole: "text"
        currentIndex: fontValue

        onCurrentIndexChanged: {
            var current = model.get(currentIndex)
            if (current) {
                fontValue = current.value
                // appearancePage.configurationChanged()
            }
        }
    }

    QtControls.Button {
        id: boldCheckBox
        icon.name: "format-text-bold"
        checkable: true
        checked: boldValue

        onToggled: {
            boldValue = checked
        }
    }

    QtControls.Button {
        id: italicCheckBox
        icon.name: "format-text-italic"
        checkable: true
        checked: italicValue

        onToggled: {
            italicValue = checked
        }
    }

    QtControls.SpinBox {
        id: fontSizeSpinBox
        from: 10
        to: 350
        value: pxSizeValue

        onValueChanged: {
            pxSizeValue = value
        }
    }

    QtControls.Label {
        text: i18n("px")
        opacity: if (enabled) 1
                 else 0.4
    }
}
