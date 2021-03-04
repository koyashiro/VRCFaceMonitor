# VRCFaceMonitor

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
