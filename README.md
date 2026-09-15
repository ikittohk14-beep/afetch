# 🌐 afetch

**afetch** is a minimalist, animated 3D ASCII system information fetch tool for Linux and Unix terminals.

It combines a real-time mathematical 3D raymarching/rendering engine with multiple selectable 3D animations (Globe, Saturn, Donut, Cube, Galaxy, DNA), sleek hardware statistics, dynamic screen centering, and ANSI Truecolor support.

```text
                               user@hostname
          =+###%               
     .+:+*##@@@@@@@@=          OS       │ Arch Linux x86_64
   +=::+*=***%##%@%%%@%        Host     │ Workstation
  :+*=*+*=***%##%%%%%%%#       Kernel   │ Linux 6.12.0
 +:+**##**##%%%%@@@@@@%#%      WM       │ Hyprland / driftwm (Wayland)
·+=+*==*%===*#*########%%*     
:+:+=+==#*#==#***%###%**%*     CPU      │ AMD Ryzen 7 (16) @ 4.80 GHz
+:::·+**###%%**#####*#%###     GPU      │ Dedicated GPU
 :·:····=*=**#*+===#%#%#=      Memory   │ 6.42 GiB / 32.00 GiB (20%)
  ...····++====*#**#**=:       Disk     │ 142.50 GiB / 1000.00 GiB (14%)
   .....::===*****==*·.        
     ··.:.:::::::=:··          Packages │ 1250 (pacman)
          ::::.·               Terminal │ kitty / alacritty
                               Colors   │ ● ● ● ● ● ● ●
```

---

## 🪐 3D Animation Modes

`afetch` features 6 distinct mathematical 3D ASCII rendering algorithms:

### 1. `globe` / `planet` *(Default)*
Raymarched 3D sphere with continental landmasses, latitude/longitude coordinate parallels, axial tilt, and specular reflection.

```text
              =+###%               
         .+:+*##@@@@@@@@=          
       +=::+*=***%##%@%%%@%        
      :+*=*+*=***%##%%%%%%%#       
     +:+**##**##%%%%@@@@@@%#%      
    ·+=+*==*%===*#*########%%*     
```

### 2. `saturn`
Raymarched 3D celestial planet surrounded by tilted elliptical orbital rings with Cassini division and planetary shadows.

```text
       ++:===++===***::==::        
   ****++:+=***###%%%%%%=::+***    
   *  *++:++====*****####::+  *    
   **** ..··:::+++======== +***    
   ***  ··::++===*********  ***    
   **** +++++====******##* +***    
```

### 3. `donut` / `torus`
Classic 3D mathematical torus rotating in dual axes with volumetric depth buffer and smooth illumination.

```text
           :+===***##              
         ·::+++===***####          
       .·::::::++:+==**###         
      ..··:::::·:::++==**###       
      ..·····.......·:+==*##=      
      .···:··.     ...:+==***      
```

### 4. `cube`
Rotating 3D solid and wireframe cube with perspective projection, shaded faces, and highlighted edges.

```text
             ######                
         ##############            
         #################         
        ####################       
        ###################        
       ####################        
```

### 5. `galaxy` / `vortex`
Rotating logarithmic spiral galaxy with accretion disk, star density gradients, and central black hole core.

```text
          . .... .. .. ..          
         .. :::: : :··   .         
        .. :      +  · ·  .        
       . ::  ====++++++··· ..      
      ·· : === *****  ++  · ..     
      · :: =  ##  **   +  · .      
   . ·   +===###%%#*=  +   ·  .    
```

### 6. `dna`
Rotating 3D double helix genetic strand with connecting base-pair rungs and depth shading.

```text
             ══════●               
             ●══════               
        ●══ ═════════ ══●          
       ● ════ ═════ ════ ●         
           ●═════════●             
               ●══                 
         ●═════════════●           
```

---

## ✨ Features

- **Mathematical 3D Raymarching**: Computes continuous pixel-by-pixel surface intersections per character cell. Zero aliasing, zero jitter, and silky smooth 35+ FPS animation.
- **Dynamic Terminal Centering**: Automatically calculates terminal width and height (`shutil.get_terminal_size()`) and centers the card both horizontally and vertically.
- **Fast System Stats**: Fetches hardware and distribution information via `fastfetch` JSON (or standard library fallback) in <20ms.
- **Truecolor Theme Harmony**: Volumetric lighting matching modern dark palettes with specular highlights, atmospheric midtones, and subtle shadows.
- **Non-Blocking Keyboard Control**: Runs continuously in an interactive loop; press any key (`Space`, `Enter`, `q`, `Esc`) or `Ctrl+C` to instantly drop into your shell prompt.

---

## 📦 Requirements

- **Python 3.10+** (Standard library only — zero pip dependencies)
- **fastfetch** (Optional, recommended for hardware stats: `pacman -S fastfetch` / `apt install fastfetch` / `brew install fastfetch`)
- Terminal supporting ANSI Truecolor (Kitty, Alacritty, Ghostty, Foot, WezTerm, etc.)

---

## 🚀 Installation

```bash
git clone https://github.com/ikittohk14-beep/afetch.git
cd afetch
./install.sh
```

Or copy manually:
```bash
mkdir -p ~/.local/bin
cp afetch ~/.local/bin/afetch
chmod +x ~/.local/bin/afetch
```

Make sure `~/.local/bin` is in your `$PATH`.

---

## 🛠️ Usage & Options

```bash
# Default mode (rotating 3D Globe):
afetch

# Select a specific 3D animation mode:
afetch -m saturn
afetch -m donut
afetch -m cube
afetch -m galaxy
afetch -m dna

# Random animation mode on every launch:
afetch -r
# or
afetch --random

# Static mode (instant 0ms output, no animation):
afetch -s
afetch -s -m saturn

# Custom FPS:
afetch --fps 60

# List all available modes:
afetch --list-modes
```

---

## 🐚 Shell Startup Integration

### Fish Shell (`~/.config/fish/config.fish`)
```fish
if status is-interactive
    afetch -r # Pick a random 3D animation on start
end

alias fetch="afetch"
```

### Bash (`~/.bashrc`) / Zsh (`~/.zshrc`)
```bash
if [[ $- == *i* ]]; then
    afetch -r
fi

alias fetch="afetch"
```

---

## 📄 License

MIT License © 2026 ikittohk14-beep
