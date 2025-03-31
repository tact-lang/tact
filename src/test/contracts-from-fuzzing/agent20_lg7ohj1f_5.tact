contract TestSliceValid {
    // Test slice compile-time function with a valid base64-encoded BoC
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    
    receive () {}
}
