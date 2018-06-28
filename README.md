<a href="https://www.bigclown.com"><img src="https://s3.eu-central-1.amazonaws.com/bigclown/gh-readme-logo.png" alt="BigClown Logo" align="right"></a>

# BigClown Enclosures

This repository contains STL models of BigClown enclosures. These model have been optimized for 3D printing.

# Overview

The model marking consists of the following format `BCExyy` and optional suffix `A`, `B`, etc. in case of multi-part models. The number `x` represents the basic structure and the number `yy` represents its variant. For fixing poth pars can be used specified rubber O-ring.

> Note: Suffix `A` denotes the base part.

The following table lists the available models:

| Model     | Type     | Module Count | Sigfox | O-ring  | Module Configuration                                                                      | Picture                               |
|-----------|----------|:------------:|--------|---------|-------------------------------------------------------------------------------------------|------------------------------------------|
| BCE101-R1 | Narrow   | 3            | No     | 45x2 mm | Mini Cover Module<br>Core Module<br>Mini Battery Module                                   |![](doc/bce101-1.png)![](doc/bce101-2.png)|
| BCE101-R2 | Narrow   | 3            | No     | 45x2 mm | Mini Cover Module<br>Core Module R2 (*1)<br>Mini Battery Module                             |                                     |
| BCE102-R1 | Narrow   | 4            | Yes    | 45x2 mm | Mini Cover Module<br>Core Module<br>Sigfox Module<br>Mini Battery Module                  |![](doc/bce102-1.png)                  |
| BCE103-R1 | Narrow   | 4            | No     | 45x2 mm | Mini Cover Module<br>Core Module<br>Sensor Module<br>Mini Battery Module                  |                                       |
| BCE104-R1 | Narrow   | 5            | Yes    | 45x2 mm | Mini Cover Module<br>Core Module<br>Sensor Module<br>Sigfox Module<br>Mini Battery Module |![](doc/bce104-1.png)![](doc/bce104-2.png)|
| BCE201-R1 | Wide     | 4            | No     | 70x2 mm | Cover Module<br>Core Module<br>CO2 Module<br>Battery Module                               |![](doc/bce201-1.png)![](doc/bce201-2.png)|
| BCE202-R1 | Wide     | 5            | Yes    | 70x2 mm | Cover Module<br>Core Module<br>Sigfox Module<br>CO2 Module<br>Battery Module              |![](doc/bce202-1.png)![](doc/bce202-2.png)|
| BCE203-R1 | Wide     | 4            | No     | 70x2 mm | LCD Module<br>Core Module<br>CO2 Module<br>Battery Module (*2)                            |![](doc/bce203-1.png)                  |
| BCE204-R1 | Wide     | 4            | No     | 70x2 mm | LCD Module<br>Core Module<br>CO2 Module or Tag Module<br>Battery Module (*3)              |![](doc/bce204-1.png)                  |
| BCE301-R1 | Wide     | 3            | No     | 70x2 mm | Cover Module<br>Core Module<br>Power Module                                               |![](doc/bce301-1.png)![](doc/bce301-2.png)|
| BCE303-R1 | Wide     | 3            | No     | 70x2 mm | Cover Module<br>Core Module<br>Battery Module                                             |                                       |
| BCE501-R1 | Custom   | 3            | No     | No      | Core Module<br>Sensor Module<br>Mini Battery Module<br>Flood Sensor LD81                  |![](doc/bce501-1.png)![](doc/bce501-2.png)|


> Enclosures are optimized for last version of Modules using 2.5 mm pin header plastic housing except note *1.
> Models are tested and optimized for 3D printer Prusa I3 MK2, print resolution 0.2 mm or better.

> Note *1: BCE101-R2 is optimized for Core Module R2 (USB position is higher).
> Note *2: Suitable for Lux Meter Tag, Tags are not covered.
> Note *3: CO2 Module can be replaced by Tag Module, Tags are covered, part bce204c.stl is optimized do 0.15 mm resolution.

List of available accessories:

| Model  | Description                                      | Picture                                  |
|--------|--------------------------------------------------|------------------------------------------|
| PIR-CV-R1 | Flat Cover for PIR Module<br>                    |                                          |
| PIR-SC-R1 | PIR Cover Hat<br>                                |                                          |
| LED-HD-R1 | Holder for 3mm LED or phototransistor SFH 3310   |![](doc/led-hd.png)                       |

> Models are tested and optimized for 3D printer Prusa I3 MK2, print resolution 0.15 mm.

# License

This project is licensed under the [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) - see the [LICENSE](LICENSE) file for details.

---

Made with &#x2764;&nbsp; by [BigClown Labs s.r.o.](https://www.bigclown.com) in Czech Republic.
