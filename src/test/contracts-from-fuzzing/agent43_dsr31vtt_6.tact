contract TestSliceValid {
    // Valid usage of slice() with a proper base64 BoC string
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive () {}
}
