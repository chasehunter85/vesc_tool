import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import SkyPuff.vesc.winch 1.0

Page {
    ScrollView {
        id: sv
        anchors.fill: parent
        clip: true

        ColumnLayout {
            width: sv.width

            GroupBox {
                title: qsTr("VESC drive settings (editable from vesc_tool)")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text { text: qsTr("Motor poles (pole pairs * 2)") }
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: motor_poles
                            value: 32
                            from: 2
                            to: 60
                            stepSize: 2
                        }}

                    RowLayout {
                        Text { text: qsTr("Gear ratio (motor turns per 1 spool turn)") }
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: gear_ratio
                            value: 1
                            from: 0.05
                            to: 20
                            decimals: 6
                            stepSize: 0.000001
                        }
                    }

                    RowLayout {
                        Text {text: qsTr("Wheel diaemeter (MM)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: wheel_diameter_mm
                            editable: true
                            value: 350
                            from: 10
                            to: 2000
                            stepSize: 5
                        }
                    }
                }
            }

            GroupBox {
                title: qsTr("SkyPUFF drive")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text {text: qsTr("Amperes per 1 KG pulling force (A)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: amps_per_kg
                            from: 0.5
                            to: 30
                            value: 3.333
                            stepSize: 0.1
                            decimals: 3
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Smooth force changing speed (KG per Sec)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: kg_per_sec
                            editable: true
                            from: 1
                            to: 600
                            value: 30
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Rope length (meters)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: rope_length
                            editable: true
                            from: 5
                            to: 5000
                            value: 1000
                            stepSize: 10
                        }
                    }
                }
            }

            GroupBox {
                title: qsTr("Braking zone")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text {text: qsTr("Braking length (meters)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: braking_length
                            editable: true
                            from: 1
                            to: 100
                            value: 15
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Passive braking length (meters)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: passive_braking_length
                            editable: true
                            from: 1
                            to: 5000
                            stepSize: 10
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Brake force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: brake_current
                            from: 0.2
                            to: 200 // High force possible, no special mode yet
                            value: 1
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                }
            }

            GroupBox {
                title: qsTr("Unwinding")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text {text: qsTr("Unwinding trigger (meters)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: unwinding_trigger_length
                            from: 0.1
                            to: 10
                            decimals: 1
                            stepSize: 0.1
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Unwinding force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: unwinding_current
                            from: 0.2
                            to: 20
                            value: 3
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Rewinding trigger (meters)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: rewinding_trigger_length
                            from: 0.5
                            to: 50
                            decimals: 1
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Rewinding force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: rewinding_current
                            from: 0.2
                            to: 40
                            value: 5
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                }
            }

            GroupBox {
                title: qsTr("Slowing")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text {text: qsTr("Slowing length (meters)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: slowing_length
                            editable: true
                            from: 1
                            to: 100
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Slowing brake force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: slowing_current
                            from: 0
                            to: 10
                            value: 0
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Slow speed (M/S)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: slow_erpm
                            from: 0.5
                            to: 5
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Maximum slow mode force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: slow_max_current
                            from: 0.2
                            to: 20
                            value: 5
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                }
            }

            GroupBox {
                title: qsTr("Winch settings")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text {text: qsTr("Default pull force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: pull_current
                            from: 0.1
                            to: 600
                            value: 100
                            decimals: 1
                            stepSize: 5
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Pre pull (%)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: pre_pull_k
                            editable: true
                            value: 25
                            from: 10
                            to: 50
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Takeoff pull (%)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: takeoff_pull_k
                            editable: true
                            value: 50
                            from: 30
                            to: 80
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Fast pull (%)")}
                        Item {Layout.fillWidth: true}
                        SpinBox {
                            id: fast_pull_k
                            editable: true
                            value: 125
                            from: 105
                            to: 150
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Takeoff trigger (meters)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: takeoff_trigger_length
                            from: 0.1
                            to: 5000
                            value: 2
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Pre pull timeout (secs)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: pre_pull_timeout
                            from: 0.1
                            to: 5
                            value: 2
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Takeoff period (secs)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: takeoff_period
                            from: 0.1
                            to: 60
                            value: 10
                            decimals: 1
                            stepSize: 0.5
                        }
                    }

                }
            }
            GroupBox {
                title: qsTr("Manual modes")
                Layout.fillWidth: true
                Layout.margins: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Text {text: qsTr("Manual brake force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: manual_brake_current
                            from: 0.2
                            to: 10
                            value: 3
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Manual slow speed (M/S)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: manual_slow_erpm
                            from: 0.5
                            to: 12
                            value: 6
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Manual slow speed up force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: manual_slow_speed_up_current
                            from: 0.2
                            to: 20
                            value: 2
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                    RowLayout {
                        Text {text: qsTr("Manual slow maximum force (KG)")}
                        Item {Layout.fillWidth: true}
                        RealSpinBox {
                            id: manual_slow_max_current
                            from: 0.2
                            to: 20
                            value: 5
                            decimals: 1
                            stepSize: 0.2
                        }
                    }
                }
            }
        }
    }

    footer: Button {
        enabled: Skypuff.state !== "DISCONNECTED"
        text: qsTr("Save")

        onClicked: {
            var cfg = Skypuff.emptySettings()

            // This part should be first
            cfg.motor_poles = motor_poles.value
            cfg.gear_ratio = gear_ratio.value
            cfg.wheel_diameter_mm = wheel_diameter_mm.value
            cfg.amps_per_kg = amps_per_kg.value

            // This part depended on values above
            cfg.kg_per_sec = kg_per_sec.value
            cfg.rope_length = rope_length.value
            cfg.braking_length_meters = braking_length.value

            Skypuff.saveSettings(cfg)
        }
    }

    Connections {
        target: Skypuff

        onSettingsChanged: {
            motor_poles.value = cfg.motor_poles
            gear_ratio.value = cfg.gear_ratio
            wheel_diameter_mm.value = cfg.wheel_diameter_mm

            // DIRTY: do not override nice UI defaults with empty conf
            if(cfg.amps_per_kg < 0.1)
                return

            amps_per_kg.value = cfg.amps_per_kg
            kg_per_sec.value = cfg.amps_per_sec / cfg.amps_to_kg
            rope_length.value = cfg.rope_length
            braking_length.value = cfg.braking_length_meters
        }
    }
}