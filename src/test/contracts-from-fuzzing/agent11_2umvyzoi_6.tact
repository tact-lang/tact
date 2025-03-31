contract Test {
    // Testing compile-time function slice with a valid base64-encoded BoC
    s: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive () {}
}
