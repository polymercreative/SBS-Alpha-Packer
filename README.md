# Side-by-Side Alpha Channel Video Processing

This repository contains tools for converting video files with alpha channels into a side-by-side format where the alpha channel is packed to the right side of the video.

## Directory Structure

- `Input`: Place your `.mov` ProRes 4444 files with alpha channels here.
- `Output`: After processing, the converted files will be saved here.
- `SBS-Alpha-h264.bat`: This script converts videos to H.264 encoded MP4 with the alpha channel packed to the side.
- `SBS-Alpha-h265.bat`: This script converts videos to H.265 (HEVC) encoded MP4 with the alpha channel packed to the side.

## Usage

Before running the scripts, ensure your input files are saved as ProRes 4444 with the 'Color' setting configured to 'Straight (Unmatted)', as shown in the provided reference image.

To process your files:

1. Place all `.mov` files you wish to convert into the `Input` directory.
2. Run either `SBS-Alpha-h264.bat` or `SBS-Alpha-h265.bat` as an administrator to begin the conversion process.
3. The script will check for necessary dependencies (FFmpeg and Chocolatey) and install or update them if required.
4. All files in the `Input` folder will be processed and the outputs will be saved in the `Output` folder, preserving the original file names.

## Dependencies (Installed Automatically)

The scripts require the following dependencies:

- FFmpeg: For video processing.
- Chocolatey: For installing and updating FFmpeg on Windows.

If these dependencies are not installed, the scripts will attempt to install them automatically.

## Notes

- The conversion maintains the original resolution and aspect ratio of the input files.
- The `SBS-Alpha-h264.bat` script uses the H.264 codec with a CRF of 18 for high-quality output.
- The `SBS-Alpha-h265.bat` script uses the H.265 codec with a default bitrate setting for efficient compression.
