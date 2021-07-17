# VRCFaceMonitor

VRC アバター用の表情確認モニタ。

![VRChat_1920x1080_2021-03-04_22-06-43 272](https://user-images.githubusercontent.com/6698252/109968925-a3846180-7d36-11eb-9781-d875546feac8.png)

## manifests.json

```json
{
  "dependencies": {
    "net.koyashiro.vrcfacemonitor": "https://github.com/koyashiro/VRCFaceMonitor.git?path=Packages/net.koyashiro.vrcfacemonitor"
  }
}
```

## 導入手順

1. `Assets/manifests.json` の `dependencies` に以下を追記。

```json
"net.koyashiro.vrcfacemonitor": "https://github.com/koyashiro/VRCFaceMonitor.git?path=Packages/net.koyashiro.vrcfacemonitor"
```

2. Unity の Project ウィンドウから `Package/VRC Face Monitor/` を開き、`ConstraintRoot.prefab` をアバターの prefab 内に入れる。

3. `ConstraintRoot/Head` を Inspector ウィンドウで開き、 `Position Constraint` 及び `Rotation Constraint` の `Sources` にアバターの Head ボーンを設定。

4. 同様に、`Position Constraint` 及び `Rotation Constraint` の `ZERO` ボタンを押下。

5. アニメーション等で `ConstraintRoot/Head/FaceMonitor` を Active に変更する。
