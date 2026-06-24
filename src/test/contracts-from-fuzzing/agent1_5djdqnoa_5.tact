/// Test case: Valid usage of compile-time function slice()
contract TestSliceValid {
    // Embedding a valid base64-encoded BoC as a Slice
    s: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive () {}
}
