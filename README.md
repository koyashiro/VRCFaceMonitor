# VRCFaceMonitor

VRC アバター用の表情確認用モニター。

![VRChat_1920x1080_2021-03-04_22-06-43 272](https://user-images.githubusercontent.com/6698252/109968925-a3846180-7d36-11eb-9781-d875546feac8.png)

## Package URL

`https://github.com/koyashiro/VRCFaceMonitor.git?path=Packages/net.koyashiro.vrcfacemonitor`

## Unity Package Manager によるインストール

1. `Window` -> `Package Manager` を選択肢し Package Manager を起動する。

   ![image](https://user-images.githubusercontent.com/6698252/126033210-9ec5dd9e-46cd-45a6-830d-eab51171ee68.png)

2. `+` -> `Add package from git URL...` を選択する。

   ![image](https://user-images.githubusercontent.com/6698252/126033246-b82e6d11-198e-4617-a006-ebf086518892.png)

3. `https://github.com/koyashiro/VRCFaceMonitor.git?path=Packages/net.koyashiro.vrcfacemonitor` を貼り付けて `Add` を選択する。

   ![image](https://user-images.githubusercontent.com/6698252/126033265-67db425d-b0a8-498f-9910-e72f97eaaa7a.png)

4. `Packages/VRC Face Monitor` にパッケージが展開される。

   ![image](https://user-images.githubusercontent.com/6698252/126033308-7e0b8195-4d6b-4963-bbc2-9e770b24b440.png)

## アバターへの導入手順

1. `Package/VRC Face Monitor` を開き、`FaceMonitor.prefab` をアバターの prefab 内に入れる。

   ![image](https://user-images.githubusercontent.com/6698252/130225133-8aff41b4-65c8-4937-923b-14404f5c60c4.png)

2. `FaceMonitor` の Position を変更し、カメラの位置を調整する。

   ![image](https://user-images.githubusercontent.com/6698252/130225782-ead3e856-9ced-43ad-8b67-35612b1258eb.png)

3. `FaceMonitor` の `Position Constraint` 及び `Rotation Constraint` の `Sources` にアバターの Head ボーンを設定する。

   ![image](https://user-images.githubusercontent.com/6698252/130226309-051c4d95-6a90-4520-aee9-ab4a0ac4ccf0.png)

4. `FaceMonitor` の `Position Constraint` 及び `Rotation Constraint` の `ZERO` ボタンを押す。

   ![image](https://user-images.githubusercontent.com/6698252/130226414-c1b93b67-1550-46e1-96aa-4f1178f54478.png)
