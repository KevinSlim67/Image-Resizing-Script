# Image Resizing Script Documentation

## 1. Purpose

The Image Resizing Script is designed to automate the process of resizing images in a specified directory. The script reads parameters from a JSON configuration file, identifies images that need resizing, and resizes them while maintaining their aspect ratio. It's a convenient tool to ensure that images are consistent in size without manual intervention.

## 2. Libraries Used

The script utilizes two command-line tools, `jq` and `ImageMagick`, to achieve its functionality:

- `jq`: This tool is used to extract values from JSON files. It's employed to read the maximum width (`maxWidth`) and the directory containing images (`imagesDir`) from the configuration JSON file.

- `ImageMagick`: This software suite provides a range of powerful tools for image manipulation. The script utilizes the `identify` command to retrieve image dimensions and the `convert` command to perform image resizing.

## 3. How to Use

Follow these steps to use the Image Resizing Script:

### Step 1: Prerequisites

Ensure you have the following software installed on your system:

- `jq`: A JSON processor. Install using appropriate commands based on your operating system.
- `ImageMagick`: A suite of image manipulation tools. Install using appropriate commands based on your operating system.

### Step 2: Prepare Configuration

Create a `parameters.json` file containing the configuration for the script:

```json
{
  "maxWidth": 1200,
  "imagesDir": "input_images"
}
```

- `"maxWidth"`: Set the desired maximum width for the resized images.
- `"imagesDir"`: Specify the directory containing the images you want to resize.

### Step 3: Run the Script

1. Save the provided Bash script in a file, e.g., `resize_images.sh`.
2. Make the script executable: `chmod +x resize_images.sh`.
3. Ensure the script file and the `parameters.json` file are in the same directory.
4. Open a terminal and navigate to the script's directory.
5. Run the script: `./resize_images.sh`.

### Step 4: Review Output

The script will process each image in the specified directory and its subdirectories. It will display messages for each image, indicating whether it was resized or skipped:

- Images that meet the size criteria will be resized and a "Processed" message will be shown.
- Images smaller than the maximum width will be skipped and a "Skipped" message will be displayed.

## 4. Conclusion

The Image Resizing Script simplifies the process of resizing images while preserving their aspect ratio. By using the `jq` and `ImageMagick` tools, it ensures efficient and accurate resizing according to the specified parameters. Following the provided steps will allow you to effortlessly process a batch of images with consistent dimensions.
