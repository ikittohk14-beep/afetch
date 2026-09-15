# 🌐 afetch

**afetch** is a minimalist, animated 3D ASCII system information fetch tool for Linux and Unix terminals.

It combines a real-time mathematical raymarching engine rendering a rotating 3D celestial planet with sleek hardware/system statistics, dynamic centering, and Truecolor theme harmony.

```text
                               user@hostname
          =+###%               
     .+:+*##@@@@@@@@=          OS       │ CachyOS x86_64
   +=::+*=***%##%@%%%@%        Host     │ B550 AORUS ELITE V2
  :+*=*+*=***%##%%%%%%%#       Kernel   │ Linux 7.1.8-1-cachyos
 +:+**##**##%%%%@@@@@@%#%      WM       │ driftwm (Wayland)
·+=+*==*%===*#*########%%*     
:+:+=+==#*#==#***%###%**%*     CPU      │ AMD Ryzen 5 5600G (12) @ 4.56 GHz
+:::·+**###%%**#####*#%###     GPU      │ Radeon Vega Series
 :·:····=*=**#*+===#%#%#=      Memory   │ 7.28 GiB / 13.49 GiB (53%)
  ...····++====*#**#**=:       Disk     │ 367.56 GiB / 461.76 GiB (79%)
   .....::===*****==*·.        
     ··.:.:::::::=:··          Packages │ 1605 (pacman)
          ::::.·               Terminal │ kitty
                               Colors   │ ● ● ● ● ● ● ●
```

---

## ✨ Features

- **Smooth 3D Planetary Raymarching**: Computes continuous ray-sphere intersections per character cell. No jumping points, zero aliasing, and silky smooth continuous rotation at 35+ FPS.
- **Dynamic Centering**: Automatically calculates terminal width and height (`shutil.get_terminal_size()`) and centers the entire card horizontally and vertically.
- **Fast System Stats**: Fetches exact hardware and distribution information in <20ms using `fastfetch` JSON output with fallback.
- **Truecolor Volumetric Shading**: Calculates light vectors, specular gleams, atmospheric midtones, and deep shadows matching the Matugen / Slate palette.
- **Instant Non-Blocking Input**: Runs continuously in an interactive loop and instantly yields control to your shell upon pressing any key (`Enter`, `Space`, `q`, `Esc`) or `Ctrl+C`.

---

## 📦 Requirements

- **Python 3.10+** (standard library only — no pip dependencies required)
- **fastfetch** (optional, recommended for hardware queries: `pacman -S fastfetch` / `paru -S fastfetch`)
- A terminal with ANSI Truecolor support (Kitty, Alacritty, Ghostty, Foot, WezTerm, etc.)
- A font with Nerd Font glyphs (for icons and clean lines)

---

## 🚀 Installation

### Fast Install:
```bash
git clone https://github.com/ikittohk14-beep/afetch.git
cd afetch
./install.sh
```

Or manually copy `afetch` to your `~/.local/bin`:
```bash
mkdir -p ~/.local/bin
cp afetch ~/.local/bin/afetch
chmod +x ~/.local/bin/afetch
```

Ensure `~/.local/bin` is in your `$PATH`.

---

## 🛠️ Usage & Options

### Continuous Interactive Mode (Default)
Runs continuous 3D rotation in the center of the terminal. Press any key to stop and drop into the shell prompt.
```bash
afetch
```

### Static Mode
Outputs a single centered frame instantaneously (0ms delay), just like a traditional fastfetch:
```bash
afetch -s
# or
afetch --static
```

### Custom Frame Rate
Change the animation speed / FPS (default is 35 FPS):
```bash
afetch --fps 60
```

---

## 🐚 Shell Startup Integration

### Fish Shell (`~/.config/fish/config.fish`)
```fish
if status is-interactive
    afetch
end

alias fetch="afetch"
```

### Bash (`~/.bashrc`) / Zsh (`~/.zshrc`)
```bash
if [[ $- == *i* ]]; then
    afetch
fi

alias fetch="afetch"
```

---

## 🎨 Palette Customization

Colors are defined at the top of the `afetch` script in ANSI Truecolor format. You can edit them to match your desktop wallpaper or Matugen theme:

```python
COLOR_DIM = "\033[38;2;146;144;146m"     # #929092 (Key labels)
COLOR_DIVIDER = "\033[38;2;71;70;72m"    # #474648 (Vertical bar │)
COLOR_TEXT = "\033[38;2;229;226;227m"    # #e5e2e3 (Values)
```

---

## 📄 License

MIT License © 2026 ikittohk14-beep
