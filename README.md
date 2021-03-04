# VRCFaceMonitor

VRCアバター用の表情確認カメラ。

![VRChat_1920x1080_2021-03-04_22-06-43 272](https://user-images.githubusercontent.com/6698252/109968925-a3846180-7d36-11eb-9781-d875546feac8.png)

## manifests.json

```json
{
  "dependencies": {
    "net.koyashiro.vrcfacemonitor": "http://github.com/KoyashiroKohaku/VRCFaceMonitor.git"
  }
}
```

## 導入手順

1. `Assets/manifests.json` の `dependencies` に以下を追記。

```json
"net.koyashiro.vrcfacemonitor": "http://github.com/KoyashiroKohaku/VRCFaceMonitor.git"
```

2. UnityのProjectウィンドウから `Package/VRC Face Monitor/` を開き、`ConstraintRoot.prefab` をアバターのprefab内に入れる。

3. `ConstraintRoot/Head` をInspectorウィンドウで開き、 `Position Constraint` 及び `Rotation Constraint` の `Sources` にアバターのHeadボーンを設定。

4. 同様に、`Position Constraint` 及び `Rotation Constraint` の `ZERO` ボタンを押下。

5. アニメーション等で `ConstraintRoot/Head/FaceMonitor` を Active に変更する。
