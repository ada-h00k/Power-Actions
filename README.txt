# Power Actions

A simple and lightweight **KDE Plasma 6 applet** that provides quick access to common power actions directly from the Plasma panel.

With a single click, you can open a small menu containing options to:

* Shut down the system
* Restart the system
* Log out of the current session

## Features

* 🔌 **Shut Down** — Powers off the computer.
* 🔄 **Restart** — Reboots the system.
* 🚪 **Log Out** — Logs out of the current Plasma session.
* 🖥️ Designed for **KDE Plasma 6**
* 🪶 Lightweight and minimal
* 🎨 Uses standard KDE/Plasma icons and components
* ♿ Includes accessible names and descriptions

## Requirements

* KDE Plasma 6
* Qt 6
* `qdbus6`
* A KDE Plasma session

The applet uses KDE's `org.kde.Shutdown` D-Bus service to perform the requested actions.

## Installation

### From the KDE Plasma Add Widgets interface

If the applet is packaged and installed as a Plasma widget, it can be added through:

**Edit Mode → Add Widgets → Power Actions**

### Manual installation

Clone the repository:

```bash
git clone https://github.com/ada-h00k/Power-Actions.git
cd YOUR_REPOSITORY
```

Install the Plasma applet using:

```bash
kpackagetool6 --type Plasma/Applet --install .
```

After installation, restart Plasma or add the widget from the **Add Widgets** menu.

> If you are developing the applet, you may need to uninstall an existing version first:
>
> ```bash
> kpackagetool6 --type Plasma/Applet --remove com.example.poweractions
> ```

## Usage

After adding **Power Actions** to your Plasma panel:

1. Click the power icon.
2. Select one of the available actions:

   * **Shut Down**
   * **Restart**
   * **Log Out**

The popup automatically closes after an action is selected.

## How It Works

The applet uses the KDE Plasma `executable` data source to execute the corresponding `qdbus6` commands.

The actions are provided by KDE's shutdown D-Bus service:

```text
org.kde.Shutdown
```

The following commands are used:

```bash
qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown
```

```bash
qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot
```

```bash
qdbus6 org.kde.Shutdown /Shutdown logout
```

This means the applet does not implement its own shutdown or session-management logic. It delegates these operations to KDE's existing services.

## Project Structure

A minimal installation contains the following files:

```text
power-actions/
├── contents/
│   └── ui/
│       └── main.qml
└── metadata.json
```

The exact directory structure may vary depending on how the applet is packaged.

## Development

The applet is written in **QML** using:

* Qt Quick
* Qt Quick Layouts
* KDE Plasma Components
* KDE Plasma 5 Support APIs
* KDE's D-Bus shutdown service

The applet targets **KDE Plasma 6** and declares Plasma 6.0 as its minimum supported version.

## Known Limitations

* The applet currently provides only shutdown, restart, and logout actions.
* The commands depend on the KDE `org.kde.Shutdown` D-Bus service.
* `qdbus6` must be available on the system.
* The applet is primarily intended for KDE Plasma sessions.

## Contributing

Contributions, bug reports, and suggestions are welcome.

If you find a bug or have an idea for an improvement, please open an issue or submit a pull request.

When submitting a pull request, please keep the following in mind:

* Keep the applet lightweight.
* Follow existing KDE/Qt conventions.
* Maintain Plasma 6 compatibility.
* Keep the user interface simple and accessible.

## License

This project is licensed under the **GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)**.

See the [`LICENSE`](LICENSE) file for the full license text.

---

Made for **KDE Plasma 6**.
