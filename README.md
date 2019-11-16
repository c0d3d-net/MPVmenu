## MPVmenu
MPVmenu lists file from given folder and creates a selection menu.

If you select a file from menu, it will be opened with MPV player.

After MPV player is closed, the menu show again until you exit.

MPVmenu2 does the same as MPVmenu but offers to check which OS you have and if MPV player is installed or not. If the OS is macOS (Darwin) and MPV player is not installed, it offers you to install MPV player via homebrew.

- **What you need:**
MPV player: https://mpv.io/ or https://github.com/mpv-player/mpv

On macOS you can install mpv using homebrew (https://brew.sh/):
    ```
    brew install mpv
    ```
    
- **How to use:**
    - Run:
        ```
        ./mpvmenu.sh
        ```
    - Type in the full path of the folder containing video files.
   
    - After you pressed Enter, MPVmenu creates a selection menu.


- **Issue:**
If the folder contatins another files/folders than media files, then they will be listed too (screenshot2).
I am still working a solution. If you know one, then let me know: dev@c0d3d.space


- **Screenshots:**


    _**Correct:**_

    ![OK](/mpvmenuOK.png)


    _**Issue:**_

    ![ISSUE](/mpvmenuNOTCLEAN.png)
