<div align="center">

# 🌐 ikifetch

**Minimalist, animated 3D ASCII & GIF system information fetch for Linux and Unix terminals.**

[English](README.md) • [Русский](README.ru.md)

</div>

---

**ikifetch** is a fast, aesthetically crafted CLI fetch tool. It combines mathematical 3D raymarching engines, animated GIF playback with GPU hardware acceleration, smart terminal detection, dynamic screen centering, and an extensible custom animation plugin architecture.

```text
                                user@hostname
           =+###%               
      .+:+*##@@@@@@@@=          OS       │ CachyOS / Arch Linux
    +=::+*=***%##%@%%%@%        Host     │ B550 AORUS ELITE V2
   :+*=*+*=***%##%%%%%%%#       Kernel   │ Linux 6.12 / 7.x
  +:+**##**##%%%%@@@@@@%#%      WM       │ driftwm / Hyprland (Wayland)
 ·+=+*==*%===*#*########%%*     
 :+:+=+==#*#==#***%###%**%*     CPU      │ AMD Ryzen 5 / 7
 +:::·+**###%%**#####*#%###     GPU      │ AMD Radeon Graphics / NVIDIA
  :·:····=*=**#*+===#%#%#=      Memory   │ 7.20 GiB / 13.50 GiB (53%)
   ...····++====*#**#**=:       Disk     │ 363.30 GiB / 461.76 GiB (78%)
    .....::===*****==*·.        
      ··.:.:::::::=:··          Packages │ 1636 (pacman)
           ::::.·               Terminal │ kitty / alacritty / foot
                                Colors   │ ● ● ● ● ● ● ●
```

---

## ✨ Key Features

* 🪐 **8 Built-in 3D Mathematical Animations:** Real-time raymarched Globe, Saturn with orbital rings, dual-axis Donut, 3D shaded Cube, spiral Galaxy, DNA double helix, pixel Cat, and pulsing Heart.
* 🎬 **Full GIF Animation Support:** Drop any `.gif` into your config or pass it directly. Automatically rendered with mathematically corrected 1:1 aspect ratio across all terminals.
* 🚀 **Native Kitty Graphics Protocol (`--kitty`):** Hardware GPU pixel rendering inside terminal cells. In-place frame replacement (`i=1, C=1`) prevents line wrapping and image stacking.
* 🧩 **Multiple Render Styles:**
  * `blocks` *(Default)*: 24-bit Truecolor half-blocks (`▀`), universal across 100% of modern terminals (Kitty, Foot, Alacritty, WezTerm, Ghostty, etc.) with Lanczos scaling and UnsharpMask sharpening.
  * `quad`: Subpixel 2×2 quadrants (`▘`, `▝`, `▖`, `▗`, `▄`, `▀`, `█`) providing double horizontal detail (56×30 dots) with native terminal alpha transparency.
  * `kitty`: Pure HD native pixel graphics directly rendered on the GPU.
  * `ascii`: 10-level grayscale monochrome ASCII art.
* 🔍 **Smart Path & Name Resolution:** Run `ikifetch cat.gif` or `ikifetch ~/Pictures/cat.gif` without extra flags. Automatically searches `~/.config/ikifetch/gifs/`, `~/Pictures/`, and `~/Downloads/`.

---

## 🪐 Built-in 3D Animation Modes

### 1. `globe` / `planet` *(Default)*
Raymarched 3D celestial sphere with continental terrain, coordinate parallels, axial tilt, and specular gleam.
```text
           =+###%
      .+:+*##@@@@@@@@=
    +=::+*=***%##%@%%%@%
   :+*=*+*=***%##%%%%%%%#
  +:+**##**##%%%%@@@@@@%#%
 ·+=+*==*%===*#*########%%*
 :+:+=+==#*#==#***%###%**%*
 +:::·+**###%%**#####*#%###
  :·:····=*=**#*+===#%#%#=
   ...····++====*#**#**=:
    .....::===*****==*·.
      ··.:.:::::::=:··
           ::::.·
```

### 2. `saturn`
3D planet surrounded by tilted elliptical planetary rings with Cassini division and casting shadows.
```text
    ++:===++===***::==::
****++:+=***###%%%%%%=::+***
*  *++:++====*****####::+  *
**** ..··:::+++======== +***
***  ··::++===*********  ***
**** +++++====******##* +***
*  *++:=·····:::::++==::+  *
****++:.··:++****+::·=::+***
    ++:===:++****+::==::
```

### 3. `donut` / `torus`
Classic 3D mathematical torus rotating simultaneously in dual axes with volumetric depth buffer.
```text
        :+===***##
      ·::+++===***####
    .·::::::++:+==**###
   ..··:::::·:::++==**###
   ..·····.......·:+==*##=
   .···:··.     ...:+==***
   .·::++++      ..·:++=**
    .::+=*##     ...:++===
    .·++==***=+:··.·::++++
     .·++++==++::···:::++
       ··+++++::····:·:·
          .·········..
```

### 4. `cube`
True 3D wireframe and shaded cube rotating in perspective space with highlighted vertices and illuminated faces.
```text
               #·#●
           ····##++#
       #····##●#++++#
    #·●·##### ##+++++#
   ######      ##+++++#
  ●#            ##+++++#
   ##     #      ##++++#●
    ##            ##++##
     #             #●##
      ##    ●#  ####
       #    ####
        ●###
```

### 5. `galaxy` / `vortex`
3D spiral galaxy with swirling star arms, dust gradients, and a central gravitational accretion core.
```text
       . .... .. .. ..
      .. :::: : :··   .
     .. :      +  · ·  .
    . ::  ====++++++··· ..
   ·· : === *****  ++  · ..
   · :: =  ##  **   +  · .
. ·   +===###%%#*=  +   ·  .
. ·   + =**#%●##  = +   · .
 . ·  +  *** *##  ==:: ·
.. ·· ++  ***** === :  ·
 ..· ··+++ ++====  :: .
   .  · ·++ +     ::..
    .    ·: : :::: ..
     ..          . .
        .. .. ...
```

### 6. `dna`
Rotating 3D double helix genetic strand with connecting nucleotide base-pair rungs.
```text
          ══════●
          ●══════
     ●══ ═════════ ══●
    ● ════ ═════ ════ ●
        ●═════════●
            ●══
      ●═════════════●
    ●═ ════ ═══ ════ ═●
       ●═══════════●
             ●
       ●═══════════●
    ● ════ ═════ ════ ●
      ●═════════════●
           ════●
         ●═══════●
```

### 7. `cat` / `neko`
Animated pixel cat with blinking eyes, breathing motion, twitching ears, and swishing tail.
```text
        |\___/|
       / ^ . ^ \
      (  = v =  )
       )       (
      /         \  ~
     (           ) )
    ( (  |   |  ) )(
     (__d|___|b__)

       "ฅ(ﾐචᆽචﾐ)ฅ"
```

### 8. `heart`
Pulsing mathematical 3D wireframe heart curve.
```text
       ##*###  ###*##
     #*·**########**·*#
    #****##########****#
    ######**····**######
    #####*········*#####
    ####*··········*####
    #####*········*#####
        ##**····**##
          ########
            ####
```

---

## 🛠️ Usage & Commands

### Basic Usage
```bash
# Default mode (rotating 3D Globe):
ikifetch

# Run any built-in 3D mode by name:
ikifetch saturn
ikifetch donut
ikifetch cube
ikifetch galaxy
ikifetch dna
ikifetch cat
ikifetch heart

# Pick a random 3D animation mode on launch:
ikifetch -r
```

### GIF Animations
`ikifetch` will search for GIF files in your current directory, `~/.config/ikifetch/gifs/`, `~/Pictures/`, or `~/Downloads/`:

```bash
# Play a GIF by name or path:
ikifetch cat.gif
ikifetch ~/Pictures/cat.gif

# Choose rendering engine:
ikifetch cat.gif --kitty                 # Native HD GPU pixel graphics (Kitty protocol)
ikifetch cat.gif quad                    # Subpixel 2x2 quadrants (double detail)
ikifetch cat.gif blocks                  # Sharp Truecolor half-blocks (default)
ikifetch cat.gif ascii                   # Retro monochrome ASCII

# Static display mode (instant output without animation, like neofetch):
ikifetch cat.gif --static
ikifetch cat.gif --kitty --static
ikifetch -s
```

### Options & Flags
```bash
ikifetch [target] [style] [options]

Positionals:
  target                Animation mode name, preset, or path/name of a .gif file.
  style                 Render style: 'blocks', 'quad', 'kitty', or 'ascii'.

Options:
  -m, --mode MODE       Animation preset name or GIF path.
  -g, --gif GIF         Explicit path to a GIF file.
  --gif-style STYLE     Render style: 'blocks' (default), 'quad', 'kitty', 'ascii'.
  --kitty               Shortcut for '--gif-style kitty'.
  -s, --static          Static mode (print single frame without animation).
  -r, --random          Pick a random animation preset.
  --fps FPS             Animation frame rate (default: 35).
  --list-modes          List all available modes (built-in, custom, GIFs) and exit.
  --check-terminal      Run environment and terminal safety diagnostics.
  --force-terminal      Bypass TTY safety checks.
```

---

## 🎨 How to Add Your Own Custom Animations

`ikifetch` includes an extensible plugin system. You can add your own animations without modifying the tool's source code:

### Method 1: Custom Python Script (`~/.config/ikifetch/modes/*.py`)

Create a Python script inside `~/.config/ikifetch/modes/`, e.g., `~/.config/ikifetch/modes/spinner.py`:

```python
def render(angle: float) -> list[str]:
    """
    Called every frame.
    Must return a list of 15 strings (each max 28 characters wide).
    ANSI truecolor escape codes are fully supported!
    """
    frame = int(angle * 6.0) % 4
    spinners = ["|", "/", "-", "\\"]
    char = spinners[frame]
    
    lines = [""] * 15
    lines[7] = f"       >>> [ {char} ] <<<       "
    return lines
```

Run your custom script:
```bash
ikifetch spinner
```

---

### Method 2: Custom ASCII Frames (`~/.config/ikifetch/frames/*.txt`)

Create a text file with ASCII frames separated by `---` inside `~/.config/ikifetch/frames/`, e.g., `~/.config/ikifetch/frames/bird.txt`:

```text
       \           /
        \  __v__  /
         ( o   o )
          \  =  /
           `---'
---
       /           \
      /   __v__     \
     (   ( o   o )   )
          \  =  /
           `---'
---
      /---.___.---\
          ( o.o )
           \ = /
            `-'
```

Run your custom frame animation:
```bash
ikifetch bird
```

---

### Method 3: Custom GIFs (`~/.config/ikifetch/gifs/*.gif`)

Simply drop any `.gif` into `~/.config/ikifetch/gifs/` or `~/Pictures/`:

```bash
mkdir -p ~/.config/ikifetch/gifs
cp cat.gif ~/.config/ikifetch/gifs/

ikifetch cat.gif
ikifetch cat.gif --kitty
```

---

## 🛡️ Interactive Terminal Safety & Diagnostics

`ikifetch` is engineered to be completely safe for your terminal workflow:

* **Non-interactive TTY Guard:** When run inside pipes, background jobs, automated tools, or non-TTY subshells, `ikifetch` quietly exits (`exit 0`), ensuring tools like `git`, `ssh`, `rsync`, or IDE terminals are never blocked.
* **Input Paste Protection:** If characters are already buffered in `stdin` (for instance, when commands are pasted on terminal launch), `ikifetch` immediately exits without consuming or corrupting the user's input stream.
* **Keystroke Preservation:** When dismiss keys are pressed, the key is preserved in the TTY buffer and delivered intact to your shell without dropping characters.
* **Diagnostics:** Run `ikifetch --check-terminal` to verify whether your current environment is a genuine interactive terminal.

---

## 🚀 Installation

### Using the Install Script
```bash
git clone https://github.com/ikittohk14-beep/ikifetch.git
cd ikifetch
./install.sh
```
*(The installer also creates an `afetch` symlink for backwards compatibility).*

### Manual Installation
```bash
mkdir -p ~/.local/bin
cp ikifetch ~/.local/bin/ikifetch
chmod +x ~/.local/bin/ikifetch
ln -sf ~/.local/bin/ikifetch ~/.local/bin/afetch
```

Make sure `~/.local/bin` is in your `$PATH`.

### Dependencies
* **Python 3.10+**
* **Pillow (PIL)** *(Optional, only required for GIF rendering)*:
  ```bash
  # Arch Linux / CachyOS:
  sudo pacman -S python-pillow
  
  # Debian / Ubuntu:
  sudo apt install python3-pil
  
  # Fedora:
  sudo dnf install python3-pillow
  ```

---

## 🐚 Shell Startup Integration

### Fish Shell (`~/.config/fish/config.fish`)
```fish
if status is-interactive
    ikifetch -r # Play random animation on shell launch
end

alias fetch="ikifetch"
```

### Bash (`~/.bashrc`) / Zsh (`~/.zshrc`)
```bash
if [[ $- == *i* ]]; then
    ikifetch -r
fi

alias fetch="ikifetch"
```

---

## 📄 License

MIT License © 2026 [ikittohk14-beep](https://github.com/ikittohk14-beep)
