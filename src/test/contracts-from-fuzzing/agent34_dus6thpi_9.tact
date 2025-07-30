contract TestAsciiValid {
    // Testing ascii() with exactly 32 ASCII characters, which is the maximum allowed
    value: Int = ascii("abcdefghijklmnopqrstuvwxyzabcdef");
    
    receive() {}
}
