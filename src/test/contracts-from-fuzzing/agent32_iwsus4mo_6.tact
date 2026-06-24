contract TestSliceValid {
    // Testing compile-time function 'slice' with valid base64 input
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive () {}
}
