contract TestAsciiNonAscii {
    // Test ascii() with a non-ASCII character
    a: Int = ascii("⚡"); // lightning emoji, 3 bytes in UTF-8
    
    receive() {
        return;
    }
}
