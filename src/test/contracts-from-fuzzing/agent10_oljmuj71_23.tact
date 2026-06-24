contract Test {
    // Testing slice() with base64 string that has leading whitespace.
    // Expected behavior: Should trigger a compile-time error due to invalid base64 encoding.
    stored: Slice = slice(" te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    receive() {}
}
