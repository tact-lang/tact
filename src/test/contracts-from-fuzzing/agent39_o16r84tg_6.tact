contract TestAsciiValid {
    // Testing ascii() with a valid string (single ASCII character)
    a: Int = ascii("a");  // Expected: 97
    
    // Testing ascii() with a multi-character string (all ASCII)
    word: Int = ascii("Hello");
    
    // Dummy receive function
    receive () {}
}
