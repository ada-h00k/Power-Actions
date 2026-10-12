# Power Actions

A simple, lightweight **KDE Plasma 6 applet** that provides quick access to common power actions directly from the Plasma panel.

With a single click, open a small menu with the following options:

* **Shut Down** — Power off the computer.
* **Restart** — Reboot the system.
* **Log Out** — Log out of the current Plasma session.

## Features

* 🔌 **Shut Down** — Powers off the computer.
* 🔄 **Restart** — Reboots the system.
* 🚪 **Log Out** — Ends the current Plasma session.
* 🖥️ Designed for **KDE Plasma 6**.
* 🪶 Lightweight and minimal.
* 🎨 Uses standard KDE/Plasma icons and components.
* ♿ Includes accessible names and descriptions.

## Requirements

* KDE Plasma 6
* Qt 6
* `qdbus6`
* An active KDE Plasma session

## Installation

### From the Add Widgets interface

Once the applet is installed and packaged, you can add it to your panel:

1. Enter **Edit Mode** in the Plasma panel.
2. Select **Add Widgets**.
3. Search for **Power Actions**.
4. Add the widget to your panel.

### Manual installation

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/ada-h00k/Power-Actions.git
cd Power-Actions
```

Install the applet using `kpackagetool6`:

```bash
kpackagetool6 --type Plasma/Applet --install .
```

After installation, add the widget through the **Add Widgets** interface. If it does not appear, try restarting Plasma.

> **Note:** If you are developing the applet and need to remove an existing installation, use the package ID defined in `metadata.json`:
>
> ```bash
> kpackagetool6 --type Plasma/Applet --remove <package-id>
> ```

Replace `<package-id>` with the actual applet package ID.

## Usage

After adding **Power Actions** to your Plasma panel:

1. Click the power icon.
2. Select one of the available actions:

   * **Shut Down**
   * **Restart**
   * **Log Out**
3. The popup closes automatically after an action is selected.

## How It Works

The applet uses Plasma's `executable` data source to execute `qdbus6` commands. These commands invoke KDE's `org.kde.Shutdown` D-Bus service, which handles the requested power or session action.

### Shut Down

```bash
qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown
```

### Restart

```bash
qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot
```

### Log Out

```bash
qdbus6 org.kde.Shutdown /Shutdown logout
```

The applet does not implement its own shutdown or session-management logic. Instead, it delegates these operations to KDE's existing services.

## Project Structure

A minimal version of the applet has the following structure:

```text
Power-Actions/
├── contents/
│   └── ui/
│       └── main.qml
└── metadata.json
```

The exact directory structure may vary depending on the package configuration.

## Development

The applet is written in **QML** and uses:

* Qt Quick
* Qt Quick Layouts
* KDE Plasma Components
* KDE Plasma applet APIs
* KDE's shutdown D-Bus service

The project targets **KDE Plasma 6** and declares Plasma 6.0 as its minimum supported version.

## Known Limitations

* Only shutdown, restart, and logout actions are currently supported.
* The applet depends on KDE's `org.kde.Shutdown` D-Bus service.
* The `qdbus6` executable must be available on the system.
* The applet is intended primarily for KDE Plasma sessions.

## Contributing

Contributions, bug reports, and suggestions are welcome!

To contribute, open an issue or submit a pull request.

When submitting a pull request, please keep the following guidelines in mind:

* Keep the applet lightweight.
* Follow established KDE and Qt conventions.
* Maintain compatibility with KDE Plasma 6.
* Keep the user interface simple and accessible.

## License

This project is licensed under the **GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)**.

See [`LICENSE`](LICENSE) for the full license text.

---

Made for **KDE Plasma 6** ❤️

