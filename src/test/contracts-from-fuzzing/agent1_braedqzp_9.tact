contract Test {
    // Valid ascii() using a 10-times repeated unicode character (⚡), each is 3 bytes, total 30 bytes, within limit.
    valid: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡");
    
    receive() {}
}
