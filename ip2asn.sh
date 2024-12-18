#!/bin/bash

# URL of the file to download
URL="https://iptoasn.com/data/ip2asn-v4.tsv.gz"

# Directory to store the downloaded and extracted files
OUTPUT_DIR="ip2asn_data"
ARCHIVE_FILE="ip2asn-v4.tsv.gz"
EXTRACTED_FILE="ip2asn-v4.tsv"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Download the gzipped file (overwrites if it already exists)
echo "Downloading file from $URL..."
curl -o "$OUTPUT_DIR/$ARCHIVE_FILE" "$URL"

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Error: Failed to download the file."
  exit 1
fi

# Extract the gzipped file (overwrites existing files without errors)
echo "Extracting the file..."
gunzip -f "$OUTPUT_DIR/$ARCHIVE_FILE"

# Verify if the extraction was successful
if [ -f "$OUTPUT_DIR/$EXTRACTED_FILE" ]; then
  echo "Extraction successful. File saved to $OUTPUT_DIR/$EXTRACTED_FILE"
else
  echo "Error: Failed to extract the file."
  exit 1
fi
