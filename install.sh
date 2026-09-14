#!/usr/bin/env bash
# 部署五笔·拼音混输方案到 ibus-rime / fcitx5-rime 用户目录
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -a TARGETS=()
[ -d "$HOME/.config/ibus/rime" ] && TARGETS+=("$HOME/.config/ibus/rime")
[ -d "$HOME/.local/share/fcitx5/rime" ] && TARGETS+=("$HOME/.local/share/fcitx5/rime")

if [ ${#TARGETS[@]} -eq 0 ]; then
  echo "错误：未找到 Rime 用户目录。"
  echo "  ibus-rime    期望：$HOME/.config/ibus/rime"
  echo "  fcitx5-rime  期望：$HOME/.local/share/fcitx5/rime"
  echo "请先安装 ibus-rime 或 fcitx5-rime 并运行一次以生成用户目录。"
  exit 1
fi

for dir in "${TARGETS[@]}"; do
  echo "==> 部署到 $dir"
  mkdir -p "$dir"
  if [ -f "$dir/default.custom.yaml" ]; then
    backup="$dir/default.custom.yaml.bak.$(date +%Y%m%d%H%M%S)"
    cp "$dir/default.custom.yaml" "$backup"
    echo "    已备份 default.custom.yaml -> $(basename "$backup")"
  fi
  cp "$SCRIPT_DIR"/data/*.yaml "$dir/"
  cp "$SCRIPT_DIR/rime-config/default.custom.yaml" "$dir/"
  echo "    已复制方案文件（wubi_pinyin / wubi86 / wubi_trad / pinyin_simp）"
done

cat <<'EOF'

部署完成。请重新部署 Rime 使配置生效：
  ibus    : ibus restart  （或注销重新登录）
  fcitx5  : 托盘输入法图标右键 -> 重新部署（或注销重新登录）

默认方案：五笔·拼音混输（五笔编码与拼音直接混打）
切换键  ：单击左 Shift 切换中英文
方案选单：F4 或 Ctrl+`
EOF
