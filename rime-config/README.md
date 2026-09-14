# rime-config — 本地输入法用户配置

本目录保存跨平台共用的 Rime 用户配置补丁。
librime 配置格式在所有平台一致，本目录内容适用于：

- Windows（小狼毫 / Weasel）— `master` 分支
- macOS（鼠须管 / Squirrel）— `squirrel` 分支
- Linux（ibus-rime / fcitx5-rime）— 独立上游项目，用户目录路径见下

## 内容

- `default.custom.yaml` — 全局用户配置补丁：
  - 启用输入方案：`wubi_pinyin`（五笔·拼音混输，唯一默认）；
  - **中英文切换改为仅左 Shift**（`Shift_L: commit_code`），右 Shift 不再触发切换（`Shift_R: noop`）。

## 应用方法

### Windows / 小狼毫

1. 将本文件复制到 Rime 用户目录（默认 `%APPDATA%\Rime`）：

   ```bat
   copy rime-config\default.custom.yaml "%APPDATA%\Rime\default.custom.yaml"
   ```

2. 重新部署：任务栏托盘右键小狼毫图标 →「重新部署」。

### macOS / 鼠须管

1. 将本文件复制到 Rime 用户目录 `~/Library/Rime/`：

   ```bash
   cp rime-config/default.custom.yaml ~/Library/Rime/default.custom.yaml
   ```

2. 重新部署：菜单栏输入法图标 →「重新部署」。

### Linux / ibus-rime 或 fcitx5-rime

1. 将本文件复制到对应 Rime 用户目录：
   - ibus-rime：`~/.config/ibus/rime/`
   - fcitx5-rime：`~/.local/share/fcitx5/rime/`
2. 重新部署（ibus：重启 ibus 或「部署」；fcitx5：右键输入法图标 →「重新部署」）。

## 效果（全平台一致）

- 默认方案为 **五笔·拼音混输**：五笔编码与拼音直接混打，五笔候选优先；
- 单击 **左 Shift** 在中文 / 英文之间切换（若打字中途按左 Shift，已输入的编码先上屏）；
- 右 Shift 不再切换中英文；
- 按 **F4** / **Ctrl+`** 呼出方案选单。
