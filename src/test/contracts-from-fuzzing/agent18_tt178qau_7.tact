contract TestSliceValid {
    // Valid use of slice() with a proper base64-encoded BoC
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    
    receive() {}
}
