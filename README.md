<a href="https://www.bigclown.com"><img src="https://s3.eu-central-1.amazonaws.com/bigclown/gh-readme-logo.png" alt="BigClown Logo" align="right"></a>

# BigClown Enclosures

This repository contains STL models of BigClown enclosures. These model have been optimized for 3D printing.

# Overview

The model marking consists of the following format `BCExyy` and optional suffix `A`, `B`, etc. in case of multi-part models. The number `x` represents the basic structure and the number `yy` represents its variant. For fixing poth pars can be used specified rubber O-ring.

> Note: Suffix `A` denotes the base part.

The following table lists the available models:

| Model  | Type     | Module Count | Sigfox | O-ring  | Module Configuration                                                                      |                                          |
|--------|----------|:------------:|--------|---------|-------------------------------------------------------------------------------------------|------------------------------------------|
| BCE101 | Narrow   | 3            | No     | 45x2 mm | Mini Cover Module<br>Core Module<br>Mini Battery Module                                   |![](doc/bce101-1.png)![](doc/bce101-2.png)|
| BCE102 | Narrow   | 4            | Yes    | 45x2 mm | Mini Cover Module<br>Core Module<br>Sigfox Module<br>Mini Battery Module                  |![](doc/bce102-1.png)                     |
| BCE104 | Narrow   | 5            | Yes    | 45x2 mm | Mini Cover Module<br>Core Module<br>Sensor Module<br>Sigfox Module<br>Mini Battery Module |![](doc/bce104-1.png)![](doc/bce104-2.png)|
| BCE201 | Wide (*1)| 4            | No     | 70x2 mm | Cover Module<br>Core Module<br>CO2 Module<br>Battery Module                               |![](doc/bce201-1.png)![](doc/bce201-2.png)|
| BCE202 | Wide     | 5            | Yes    | 70x2 mm | Cover Module<br>Core Module<br>Sigfox Module<br>CO2 Module<br>Battery Module              |![](doc/bce202-1.png)![](doc/bce202-2.png)|
| BCE301 | Wide (*2)| 3            | No     | 70x2 mm | Cover Module<br>Core Module<br>Power Module                                               |![](doc/bce301-1.png)![](doc/bce301-2.png)|
| BCE302 | Wide (*3)| 4            | No     | 70x2 mm | LCD Module<br>Core Module<br>Encoder Module<br>Power Module                               |                                          |
| BCE501 | Custom   | 3            | Yes    | No      | Core Module<br>Sensor Module<br>Mini Battery Module<br>Flood Sensor LD81                  |![](doc/bce501-1.png)![](doc/bce501-2.png)|

> Enclosures are optimized for last version of Modules using 2.5 mm pin header plastic housing except note *1,*2,*3:<br />
> Note *1: Micro USB connector position is optimized for old low pprofile version of Core Module with 1.5 mm pin header housing.<br />
> Note *2: Micro USB connector position and enclosure height is optimized for old low profile version of Core Module with 1.5 mm pin header housing, Power Module growe is optimized for 1.0 mm old version PCB inted of 1.5 mm.<br />
> Note *3: Invalid order of modules (Power - Encoder), Power Module growe is optimized for 1.0 mm old version PCB inted of 1.5 mm.

# License

This project is licensed under the [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) - see the [LICENSE](LICENSE) file for details.

---

Made with &#x2764;&nbsp; by [BigClown Labs s.r.o.](https://www.bigclown.com) in Czech Republic.
