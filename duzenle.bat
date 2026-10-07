@echo off
chcp 65001 >nul
cd /d "%~dp0"

:: Scriptin kendi adını değişkene al (Kendini taşımasını engellemek için)
set "SCRIPT_NAME=%~nx0"

:: Klasörleri oluştur
if not exist "Kurulum Dosyalari" mkdir "Kurulum Dosyalari"
if not exist "Belgeler" mkdir "Belgeler"
if not exist "Resimler" mkdir "Resimler"
if not exist "Videolar" mkdir "Videolar"
if not exist "Muzikler" mkdir "Muzikler"
if not exist "Arsivler" mkdir "Arsivler"

:: Kurulum ve Programlar
for %%e in (exe msi bat cmd iso) do (
    for %%f in (*.%%e) do (
        if /i not "%%~nxf"=="%SCRIPT_NAME%" move "%%f" "Kurulum Dosyalari\" >nul 2>&1
    )
)

:: Belgeler
for %%e in (pdf doc docx txt xls xlsx ppt pptx csv) do (
    for %%f in (*.%%e) do (
        if /i not "%%~nxf"=="%SCRIPT_NAME%" move "%%f" "Belgeler\" >nul 2>&1
    )
)

:: Resimler
for %%e in (jpg jpeg png gif webp svg ico psd bmp) do (
    for %%f in (*.%%e) do (
        if /i not "%%~nxf"=="%SCRIPT_NAME%" move "%%f" "Resimler\" >nul 2>&1
    )
)

:: Videolar
for %%e in (mp4 mkv avi mov wmv flv) do (
    for %%f in (*.%%e) do (
        if /i not "%%~nxf"=="%SCRIPT_NAME%" move "%%f" "Videolar\" >nul 2>&1
    )
)

:: Ses ve Müzik
for %%e in (mp3 wav ogg flac aac) do (
    for %%f in (*.%%e) do (
        if /i not "%%~nxf"=="%SCRIPT_NAME%" move "%%f" "Muzikler\" >nul 2>&1
    )
)

:: Sıkıştırılmış Arşivler
for %%e in (zip rar 7z tar gz) do (
    for %%f in (*.%%e) do (
        if /i not "%%~nxf"=="%SCRIPT_NAME%" move "%%f" "Arsivler\" >nul 2>&1
    )
)

echo.
echo =========================================
echo  Dosya duzenleme islemi basariyla tamamlandi.
echo =========================================
pause