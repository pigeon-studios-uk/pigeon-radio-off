# Changelog

All notable changes to Pigeon Radio Off are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

First release.

### Highlights

- The radio starts off when you get in to drive
- No radio at all in the vehicles you choose
- Stations taken off the wheel for everyone

### Added

- The radio switched off when a player gets in to drive, and held off while the engine starts, with `Config.StartOff`.
- Vehicle classes and vehicles with no radio, in `Config.NoRadioClasses` and `Config.NoRadioVehicles`.
- Stations taken off the radio wheel everywhere, in `Config.HiddenStations`.
- Everything put back when the resource stops.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-radio-off/commits/main
