# 分支說明：squirrel — 鼠鬚管（macOS Squirrel）

本分支是 **Rime 輸入法引擎的 macOS 前端：鼠鬚管（Squirrel）**。

| 項目 | 內容 |
| --- | --- |
| 目標平台 | macOS |
| 主要技術棧 | Objective-C / Swift / Cocoa / Input Method Kit |
| 構建系統 | Xcode（`Squirrel.xcodeproj`、`Makefile`） |
| 主要目錄 | `sources/`、`Squirrel.xcodeproj/`、`Sparkle/`、`package/`、`rime-config/` |
| 上游項目 | https://github.com/rime/squirrel |

## 關於同倉庫的 `master` 分支

同倉庫內還存在另一個長期並行分支 **`origin/master`**，它與本分支 **無共同祖先、不應合併**：

- `master` 分支是 **Windows 前端：小狼毫 Weasel**，使用 C++ / MSVC / Windows TSF，與本分支在技術棧、API、目標平台上完全不同。
- 兩個分支歷史上由 Rime 上游社區作為兩個獨立項目維護，分別對應 `rime/squirrel` 與 `rime/weasel`。
- 將 `master` 合併到 `squirrel` 會產生毫無意義的衝突並破壞 macOS 代碼；反之亦然。

切換到 `master` 分支查看 Windows 版本：

```bash
git checkout origin/master
```

如需查看本分支最新提交：

```bash
git log --oneline -10
```

---

授權條款：GPL v3　　項目主頁：https://rime.im
