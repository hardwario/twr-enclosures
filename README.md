<a href="https://www.hardwario.com/"><img src="https://www.hardwario.com/ci/assets/hw-logo.svg" width="200" alt="HARDWARIO Logo" align="right"></a>


# HARDWARIO Enclosures

This repository contains Openscad and STL models of HARDWARIO IoT Kit enclosures. These model have been optimized for 3D printing.

# Overview

The following table lists the available models:

| _____Model/Preview | STL Model                     | _____Module/setup                                               | #Layers | #Mini | #Standard | #Tag | I/O Terminal         | Antenne | USB | Compatibility              |
| --------------------- | ----------------------------- | -------------------------------------------------------------------- | ------- | ----- | --------- | ---- | -------------------- | ------- | --- | -------------------------- |
| ![](doc/hwe101.png)      | HWE101A<br>HWE101B            | Mini Battery<br>Core<br>Mini Cover\*                                 | 3       | 3     | \-        | \-   | \-                   | \-      | Yes |                            |
| ![](doc/hwe102.png)      | HWE102A<br>HWE102B            | Mini Battery<br>LoRa / Sigfox<br>Core<br>Mini Cover\*                | 4       | 4     | \-        | \-   | \-                   | Yes     | Yes |                            |
| ![](doc/hwe103.png)      | HWE103A<br>HWE103B            | Mini Battery<br>RS-485<br>Core<br>Mini Cover\*                       | 4       | 4     | \-        | \-   | 4P/3.5 mm            | \-      | Yes | 1-Wire R1.1<br>Sensor R1.0 |
| ![](doc/hwe104.png)      | HWE104A<br>HWE104B            | Mini Battery<br>LoRa / Sigfox<br>RS-485<br>Core<br>Mini Cover\*      | 5       | 5     | \-        | \-   | 4P/3.5 mm            | Yes     | Yes | 1-Wire R1.1<br>Sensor R1.0 |
| ![](doc/hwe105.png)      | HWE105A<br>HWE104B            | Mini Battery<br>Sensor R1.1<br>Core<br>Mini Cover\*                  | 4       | 4     | \-        | \-   | 5P/3.5 mm            | \-      | Yes |                            |
| ![](doc/hwe106.png)      | HWE106A<br>HWE106B            | Mini Battery<br>LoRa / Sigfox<br>Sensor R1.1<br>Core<br>Mini Cover\* | 5       | 5     | \-        | \-   | 5P/3.5 mm            | Yes     | Yes |                            |
| ![](doc/hwe108.png)      | HWE108A<br>HWE108B            | Mini Battery<br>Relay<br>Core<br>Mini Cover\*                        | 4       | 4     | \-        | \-   | 3P/3.81 mm           | \-      | Yes |                            |
| ![](doc/hwe109.png)      | HWE109A<br>HWE109B            | Mini Battery<br>LoRa / Sigfox<br>Relay<br>Core<br>Mini Cover\*       | 5       | 5     | \-        | \-   | 3P/3.81 mm           | \-      | Yes |                            |
| ![](doc/hwe201.png)      | HWE201A<br>HWE201B            | Battery<br>CO2 (+ 3xTag)<br>Core<br>Cover                            | 4       | 4     | 1         | 3    | \-                   | \-      | Yes |                            |
| ![](doc/hwe202.png)      | HWE202A<br>HWE202B            | Battery<br>CO2 (+ 3xTag)<br>LoRa / Sigfox<br>Core<br>Cover           | 5       | 5     | 2         | 3    | \-                   | Yes     | Yes |                            |
| ![](doc/hwe203.png)      | HWE203A<br>HWE203B            | Battery<br>CO2 (+3xTag inner)<br>Core<br>LCD\*                       | 4       | 4     | 2         | 3    | \-                   | \-      | Yes |                            |
| ![](doc/hwe204.png)      | HWE204A<br>HWE204B<br>HWE204C | Battery<br>CO2 (+ 3xTag)<br>Core<br>LCD\*                            | 4       | 4     | 2         | 3    | \-                   | \-      | Yes |                            |
| ![](doc/hwe205.png)      | HWE205A<br>HWE205B            | Battery (+ 1xTag)<br>Core<br>Cover                                   | 3       | 3     | 1         | 1    | \-                   | \-      | Yes |                            |
| ![](doc/hwe206.png)      | HWE206A<br>HWE206B<br>HWE206C | Battery<br>CO2 (+ 3xTag)<br>LoRa / Sigfox<br>Core<br>LCD\*           | 5       | 5     | 3         | 3    | \-                   | Yes     | Yes |                            |
| ![](doc/hwe208.png)      | HWE208A<br>HWE208B<br>HWE208C | Battery (+ 1xTag)<br>Core<br>Split<br>LCD\* & Climate\* (+ 2xTag)    | 4       | 4     | 3         | 3    | \-                   | Yes     | Yes |                            |
| ![](doc/hwe209.png)      | HWE209A<br>HWE209B<br>HWE209C | Battery (+ 1xTag)<br>Core<br>Compact Split<br>LCD\* & Climate\*      | 4       | 4     | 3         | 1    | \-                   | Yes     | Yes |                            |
| ![](doc/hwe210.png)      | HWE210A<br>HWE210B<br>HWE210C | Battery (+ 1xTag)<br>Core<br>Split<br>LCD\* & Climate\*              | 4       | 4     | 3         | 1    | \-                   | Yes     | Yes |                            |
| ![](doc/hwe211.png)      | HWE211A<br>HWE211B<br>HWE211C | Battery (+ 1xTag)<br>LoRa / Sigfox<br>Core<br>LCD\*                  | 4       | 4     | 3         | 1    | \-                   | \-      | Yes |                            |
| ![](doc/hwe301.png)      | HWE301A<br>HWE301B            | Power (+ 2xTag)<br>Core<br>Cover                                     | 3       | 3     | 1         | 2    | 3P/3.81 mm 3P/5.0 mm | \-      | Yes |                            |
| ![](doc/hwe302.png)      | HWE302A<br>HWE302B<br>HWE302C | Power (+ 2xTag)<br>Core<br>Encoder                                   | 3       | 3     | 1         | 2    | 3P/3.81 mm 3P/5.0 mm | \-      | Yes |                            |
| ![](doc/hwe304.png)      | HWE304A<br>HWE304B            | Power (+ 2xTag)<br>LoRa / Sigfox<br>Core<br>Cover                    | 4       | 4     | 2         | 2    | 3P/3.81 mm 3P/5.0 mm | Yes     | Yes |                            |
| ![](doc/hwe305.png)      | HWE305A<br>HWE305B            | Power (+ 2xTag)<br>LoRa / Sigfox<br>CO2 (+ 3xTag)<br>Core<br>Cover   | 5       | 3     | 2         | 5    | 3P/3.81 mm 3P/5.0 mm | Yes     | Yes |                            |
| ![](doc/hwe401.png)      | HWE401A<br>HWE401B            | 1-Wire<br>Climate                                                    | 2       | 2     | 2         | \-   | 4P/3.5 mm            | \-      | \-  |                            |
| ![](doc/hwe402.png)      | HWE402A<br>HWE402B            | Bridge<br>Climate / Humidity Tag                                     | 1       | 1     | 1         | 1    | \-                   | \-      | Yes |                            |
| ![](doc/hwe501.png)      | HWE501A<br>HWE501B            | Mini Battery<br>Sensor + Flood Detector<br>Core                      | 3       | 3     | \-        | \-   | \-                   | \-      | \-  |                            |
| ![](doc/hwe502.png)      | HWE502A<br>HWE502B            | Mini Battery<br>Sensor + Flood detector<br>Core<br>LoRa / Sigfox     | 4       | 4     | \-        | \-   | \-                   | Yes     | \-  |

> *Note: As top floor these Modules are available: Cover, LED, PIR, CLIMATE, GPS or Infra Grid Module
> Models are tested and optimized for 3D printer Prusa I3 MK2, print resolution 0.2 mm or better.


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

Made with &#x2764;&nbsp; by [HARDWARIO s.r.o.](https://www.hardwario.com) in Czech Republic.
