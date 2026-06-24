contract TestAsciiValid {
    // Testing compile-time function 'ascii' with valid ASCII and unicode characters
    a: Int = ascii("a");            // Expected: 97
    lightning: Int = ascii("⚡");    // Expected: 14850721
    
    receive () {}
}
