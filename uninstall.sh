#!/usr/bin/env bash
# 移除本分支部署的方案文件（不影响用户词库 *.userdb）
set -euo pipefail

declare -a TARGETS=()
[ -d "$HOME/.config/ibus/rime" ] && TARGETS+=("$HOME/.config/ibus/rime")
[ -d "$HOME/.local/share/fcitx5/rime" ] && TARGETS+=("$HOME/.local/share/fcitx5/rime")

FILES="wubi86.dict.yaml wubi86.schema.yaml wubi_pinyin.schema.yaml wubi_trad.schema.yaml pinyin_simp.dict.yaml pinyin_simp.schema.yaml default.yaml default.custom.yaml"

if [ ${#TARGETS[@]} -eq 0 ]; then
  echo "未找到 Rime 用户目录，无需移除。"
  exit 0
fi

for dir in "${TARGETS[@]}"; do
  echo "==> 从 $dir 移除"
  for f in $FILES; do
    if [ -f "$dir/$f" ]; then
      rm -f "$dir/$f"
      echo "    已删除 $f"
    fi
  done
done

cat <<'EOF'

移除完成。建议同时清理部署缓存并重新部署：
  rm -rf ~/.config/ibus/rime/build        # ibus-rime
  rm -rf ~/.local/share/fcitx5/rime/build # fcitx5-rime
然后重新部署（或注销重新登录）。
EOF
