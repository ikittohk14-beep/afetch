# 🌐 afetch

**afetch** is a minimalist, animated 3D ASCII system information fetch tool for Linux and Unix terminals.

It combines mathematical 3D raymarching/rendering engines with multiple selectable animation modes (Globe, Saturn, Donut, Cube, Galaxy, DNA, Cat, Heart), dynamic screen centering, hardware statistics, and an extensible custom animation plugin system.

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

## 🛠️ Usage & Flags

```bash
# Default mode (rotating 3D Globe):
afetch

# Run a specific animation mode:
afetch -m saturn
afetch -m donut
afetch -m cube
afetch -m galaxy
afetch -m dna
afetch -m cat
afetch -m heart

# Pick a random animation every time:
afetch -r
# or
afetch --random

# Static mode (instant 0ms output without animation):
afetch -s
afetch -s -m cat

# Set custom frame rate (default is 35 FPS):
afetch --fps 60

# List all available built-in and custom modes:
afetch --list-modes
```

---

## 🎨 How to Add Your Own Custom Animations

`afetch` includes an extensible custom plugin loader. You can add animations in two ways without modifying the source code:

### Method 1: Custom Python Script (`~/.config/afetch/modes/*.py`)

Create a Python file inside `~/.config/afetch/modes/`, e.g., `~/.config/afetch/modes/spinner.py`:

```python
import math

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

Now run your custom animation:
```bash
afetch -m spinner
```

---

### Method 2: Custom ASCII Frame File (`~/.config/afetch/frames/*.txt`)

Create a text file with ASCII frames separated by `---` inside `~/.config/afetch/frames/`, e.g., `~/.config/afetch/frames/bird.txt`:

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

Now run your custom ASCII frame animation:
```bash
afetch -m bird
```

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

Ensure `~/.local/bin` is in your `$PATH`.

---

## 🐚 Shell Startup Integration

### Fish Shell (`~/.config/fish/config.fish`)
```fish
if status is-interactive
    afetch -r # Random 3D animation on start
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
