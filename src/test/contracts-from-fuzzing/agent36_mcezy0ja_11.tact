contract TestSliceValid {
    // Testing slice() with a valid base64-encoded BoC string as shown in official docs
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    receive() {}
}
