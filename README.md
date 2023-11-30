# Side-by-Side Alpha Channel Video Processing

This repository contains tools for converting video files with alpha channels into a side-by-side format where the alpha channel is packed to the right side of the video.

## Installation

- Download and unzip `SBS-Alpha-Packer-main.zip`.
- Run `Setup.bat` to install or update dependencies. Windows Defender may flag this here but you can select `More Info` and then `Run Anyway` to ignore this.

## Usage

Before running the scripts, ensure your input files are saved as ProRes 4444 with the 'Color' setting configured to 'Straight (Unmatted)', as shown in the provided reference image.

To process your files:

1. Place all `.mov` files you wish to convert into the `Input` directory.
2. Run the `.bat` file that fits your needs, such as `SBS-Alpha-h264.bat` or `SBS-Alpha-h265.bat`.
3. All files in the `Input` folder will be processed and the outputs will be saved in the `Output` folder, preserving the original file names.

## Dependencies (Installed During Setup)

The scripts require the following dependencies:

- Curl: Used to install Chocolatey package manager from a URL. This is included in versions of Windows 10 or 11 starting at 1803.
- Chocolatey: For installing and updating FFmpeg on Windows.
- FFmpeg: For video processing.

If these dependencies are not installed, the setup script will attempt to install them automatically.

## Notes

- The `SBS-Alpha-h264.bat` script uses H.264 codec, and will double your input video width.
- The `SBS-Alpha-h265.bat` script uses H.265 (HEVC) codec, and will double your input video width.
- The `SBS-Alpha-Anamorphic-h264` script uses H.264 codec, and squashes the input video to maintain the original video width.
- The `SBS-Alpha-Anamorphic-h265` script uses H.265 (HEVC) codec, and squashes the input video to maintain the original video width.
