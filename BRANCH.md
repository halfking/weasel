# 分支說明：master — 小狼毫（Windows Weasel）

本分支是 **Rime 輸入法引擎的 Windows 前端：小狼毫（Weasel）**。

| 項目 | 內容 |
| --- | --- |
| 目標平台 | Windows 8.1 ～ Windows 11 |
| 主要技術棧 | C++ / MSVC / Windows TSF（文字服務框架） |
| 構建系統 | MSBuild（`build.bat`、`weasel.sln`） |
| 主要目錄 | `WeaselTSF/`、`WeaselServer/`、`WeaselSetup/`、`WeaselUI/`、`WeaselIPC/`、`WeaselIPCServer/`、`RimeWithWeasel/`、`WeaselDeployer/` |
| 上游項目 | https://github.com/rime/weasel |

## 關於同倉庫的 `squirrel` 與 `linux` 分支

同倉庫內還存在兩個長期並行分支 **`origin/squirrel`** 與 **`origin/linux`**，它們與本分支 **無共同祖先、不應合併**：

- `squirrel` 分支是 **macOS 前端：鼠鬚管（Squirrel）**，使用 Swift / Xcode 構建，與本分支在技術棧、API、目標平台上完全不同。
- `linux` 分支是 **Linux 平台的方案數據與用戶配置集**（配合獨立上游 ibus-rime / fcitx5-rime 使用），不含前端源碼。
- 三個分支歷史上相互獨立；`master` 與 `squirrel` 分別對應上游 `rime/weasel` 與 `rime/squirrel`。
- 將其它分支合併到 `master` 會產生毫無意義的衝突並破壞 Windows 代碼；反之亦然。
- 三個分支的 **方案數據保持同步**：五笔·拼音混输（`wubi_pinyin`，默認）＋ **左 Shift 切換中英文**。

切換到 `squirrel` / `linux` 分支：

```bash
git checkout origin/squirrel   # macOS 鼠鬚管
git checkout origin/linux      # Linux 方案與配置
```

如需查看本分支最新提交：

```bash
git log --oneline -10
```

---

授權條款：GPLv3　　項目主頁：https://rime.im
