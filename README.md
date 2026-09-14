# Rime for Linux — 五笔·拼音混合输入

本分支提供 Rime 在 **Linux** 上的「五笔·拼音混输」方案数据与配置，配合
[ibus-rime](https://github.com/rime/ibus-rime) 或
[fcitx5-rime](https://github.com/fcitx/fcitx5-rime) 使用。

## 特性

- **五笔·拼音混输**：五笔编码与拼音直接混打，无需切换；同码时五笔候选优先
- **左 Shift 切换中英文**：单击左 Shift 在中/英文间切换；右 Shift 保留原键功能
- 默认只启用「五笔·拼音」一个方案，开箱即用；`F4` / ``Ctrl+` `` 可呼出方案选单

## 安装步骤

### 1. 安装 Rime 前端

```bash
# Debian / Ubuntu（ibus）
sudo apt install ibus-rime

# Debian / Ubuntu（fcitx5）
sudo apt install fcitx5-rime

# Fedora（ibus）
sudo dnf install ibus-rime

# Fedora（fcitx5）
sudo dnf install fcitx5-rime

# Arch Linux
sudo pacman -S ibus-rime     # 或 fcitx5-rime
```

### 2. 部署本方案

```bash
git clone -b linux https://github.com/halfking/weasel.git weasel-linux
cd weasel-linux
./install.sh
```

`install.sh` 会自动检测 ibus-rime / fcitx5-rime 的用户目录，备份已有
`default.custom.yaml`，复制方案文件并提示重新部署。

### 3. 重新部署

- **ibus**：注销重登，或执行 `ibus restart`
- **fcitx5**：右键系统托盘输入法图标 →「重新部署」，或执行
  `qdbus org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1.SetConfig "!/CurrentInputMethod" rime`
  （最简单：注销重登）

## 目录结构

| 路径 | 说明 |
| --- | --- |
| `data/` | 方案数据（复制到 Rime 用户目录） |
| `rime-config/default.custom.yaml` | 用户配置补丁（五笔·拼音默认 + 左 Shift 切换） |
| `install.sh` / `uninstall.sh` | 部署 / 移除脚本 |

## 手动部署

若不想用脚本，把 `data/*.yaml` 与 `rime-config/default.custom.yaml`
复制到对应用户目录即可：

```bash
# ibus-rime
cp data/*.yaml ~/.config/ibus/rime/
cp rime-config/default.custom.yaml ~/.config/ibus/rime/

# fcitx5-rime
cp data/*.yaml ~/.local/share/fcitx5/rime/
cp rime-config/default.custom.yaml ~/.local/share/fcitx5/rime/
```

## 相关分支

- [`master`](https://github.com/halfking/weasel/tree/master) — Windows 小狼毫（含 NSIS 安装包）
- [`squirrel`](https://github.com/halfking/weasel/tree/squirrel) — macOS 鼠须管

三个分支的方案数据保持同步；librime 配置格式跨平台一致。
