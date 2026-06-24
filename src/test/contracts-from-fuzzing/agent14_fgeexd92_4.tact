contract TestSliceValid {
    // Using a valid base64 encoded cell for slice
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive () {}
}
