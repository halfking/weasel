# 分支說明：linux — Rime for Linux（方案與配置）

本分支是 **Rime 輸入法引擎在 Linux 平台的方案數據與用戶配置集**。

Linux 上的 Rime 前端（輸入法框架插件）是獨立的上游項目，不在本倉庫維護源碼：

| 前端 | 上游項目 | Rime 用戶目錄 |
| --- | --- | --- |
| ibus-rime | https://github.com/rime/ibus-rime | `~/.config/ibus/rime` |
| fcitx5-rime | https://github.com/fcitx/fcitx5-rime | `~/.local/share/fcitx5/rime` |

本分支提供開箱即用的方案數據與配置，裝好前端後執行 `install.sh` 即可。

## 內容

- `data/` — Rime 方案數據（與 `master`、`squirrel` 分支完全一致）：
  - `wubi_pinyin.schema.yaml` — **五笔·拼音混输**（默認方案，五筆與拼音直接混打，五筆候選優先）
  - `wubi86.dict.yaml` / `wubi86.schema.yaml` — 五筆 86 碼表
  - `wubi_trad.schema.yaml` — 五筆·簡入繁出
  - `pinyin_simp.dict.yaml` / `pinyin_simp.schema.yaml` — 拼音（混輸與反查用）
  - `default.yaml` — 共享默認配置（默認僅啟用五笔·拼音；**左 Shift 切換中英文**）
- `rime-config/default.custom.yaml` — 用戶目錄配置補丁（與 data/default.yaml 同效果，優先級更高）
- `install.sh` — 自動檢測 ibus-rime / fcitx5-rime 用戶目錄並部署
- `uninstall.sh` — 移除本方案文件

## 平台行為

- 默認方案：**五笔·拼音混输**；`F4` / ``Ctrl+` `` 呼出方案選單
- 單擊 **左 Shift** 切換中／英文（打字中途按左 Shift，已輸入編碼先上屏）；右 Shift 不再切換

## 關於同倉庫的其它分支

同倉庫還有兩個長期並行分支，均與本分支**無共同祖先、不應合併**：

- `master` — Windows 前端：小狼毫 Weasel（C++ / MSVC / TSF），上游 https://github.com/rime/weasel
- `squirrel` — macOS 前端：鼠鬚管 Squirrel（Swift / InputMethodKit），上游 https://github.com/rime/squirrel

三個分支的方案數據（`data/` 下的 yaml）保持同步，librime 配置格式跨平台一致。
