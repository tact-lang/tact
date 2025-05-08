contract TestSliceValid {
    // Valid usage of compile-time function slice with a proper base64-encoded BoC
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    
    // Dummy receive function to ensure contract validity
    receive () {}
}
