contract TestAsciiValid {
    a: Int = ascii("a");            // Expected: 97
    b: Int = ascii("⚡");           // Expected: value for ⚡ (3-byte UTF-8)
    c: Int = ascii("⚡⚡");          // Expected: concatenated value for two ⚡
    
    receive () {}
}
