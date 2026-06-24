contract TestAscii {
    // Testing compile-time function ascii with simple ASCII and Unicode characters in strings
    a: Int = ascii("a");            // Expected: 97
    b: Int = ascii("⚡");           // Expected: platform-specific value from Unicode representation, e.g., 14850721
    c: Int = ascii("⚡⚡");          // Expected: concatenation of two emoji values
    
    receive() {
        // Contract entry point does nothing at runtime; testing compile-time conversion.
    }
}
