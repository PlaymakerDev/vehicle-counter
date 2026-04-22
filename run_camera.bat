@echo off
cd /d "%~dp0"

echo.
echo =======================================
echo   Vehicle Counter -- Backend Selection
echo =======================================
echo   [1] GPU  (CUDA)  -- recommended
echo   [2] CPU          -- slower, always works
echo =======================================
echo.
set /p CHOICE="Enter 1 or 2: "

if "%CHOICE%"=="2" (
    echo.
    echo [INFO] Starting with CPU backend...
    echo.
    python vehicle_counter.py "rtsp://root:pass@axis-b8a44fe03000-rama3-10-207-200-7.tail8176dd.ts.net/axis-media/media.amp?resolution=1280x960" --config "config\scene_config.json" --stats live_stats.json --cpu
) else (
    echo.
    echo [INFO] Starting with GPU backend...
    echo [INFO] Will exit if CUDA is not available. Run option 2 to use CPU instead.
    echo.
    python vehicle_counter.py "rtsp://root:pass@axis-b8a44fe03000-rama3-10-207-200-7.tail8176dd.ts.net/axis-media/media.amp?resolution=1280x960" --config "config\scene_config.json" --stats live_stats.json --gpu
)

pause
