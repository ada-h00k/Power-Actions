import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents3
import org.kde.plasma.plasma5support as Plasma5Support

PlasmoidItem {
    id: root

    toolTipMainText: "Power Actions"
    toolTipSubText: "Shut down, restart or log out"

    Plasma5Support.DataSource {
        id: executable

        engine: "executable"

        onNewData: function(sourceName, data) {
            disconnectSource(sourceName)
        }
    }

    function execute(command) {
        executable.connectSource(command)
    }

    function shutdown() {
        execute("qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown")
    }

    function reboot() {
        execute("qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot")
    }

    function logout() {
        execute("qdbus6 org.kde.Shutdown /Shutdown logout")
    }

    compactRepresentation: PlasmaComponents3.ToolButton {
        id: powerButton

        icon.name: "system-shutdown"

        icon.width: 24
        icon.height: 24

        display: PlasmaComponents3.ToolButton.IconOnly

        onClicked: {
            root.expanded = !root.expanded
        }

        Accessible.name: "Power Actions"
        Accessible.description:
        "Shut down, restart or log out"
    }

    fullRepresentation: Item {
        id: popup

        implicitWidth: 280
        implicitHeight: column.implicitHeight + 24

        Layout.minimumWidth: 280
        Layout.minimumHeight: column.implicitHeight + 24

        ColumnLayout {
            id: column

            anchors.fill: parent
            anchors.margins: 12

            spacing: 6

            PlasmaComponents3.Label {
                text: "Power"

                font.bold: true

                Layout.fillWidth: true
                Layout.bottomMargin: 4
            }

            PlasmaComponents3.Button {
                text: "Shut Down"
                icon.name: "system-shutdown"

                Layout.fillWidth: true

                onClicked: {
                    root.shutdown()
                    root.expanded = false
                }
            }

            PlasmaComponents3.Button {
                text: "Restart"
                icon.name: "system-reboot"

                Layout.fillWidth: true

                onClicked: {
                    root.reboot()
                    root.expanded = false
                }
            }

            PlasmaComponents3.Button {
                text: "Log Out"
                icon.name: "system-log-out"

                Layout.fillWidth: true

                onClicked: {
                    root.logout()
                    root.expanded = false
                }
            }
        }
    }
}
