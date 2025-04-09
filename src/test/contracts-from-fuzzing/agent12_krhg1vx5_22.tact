contract Test {
    // Fuzz Test E.6: Using a non-ASCII Unicode character that occupies 4 bytes.
    // The character '𐍈' (Gothic letter hwair, U+10348) is used.
    a: Int = ascii("𐍈");
    
    receive() {}
}
