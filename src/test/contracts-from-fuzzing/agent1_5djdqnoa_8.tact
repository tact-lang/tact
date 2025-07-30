/// Test case: Valid usage of compile-time function ascii()
contract TestAsciiValid {
    // Valid ascii conversion: single ASCII character
    a: Int = ascii("a");            // Expected: 97
    // Valid ascii conversion: Unicode lightning bolt (⚡ → multiple bytes)
    zap: Int = ascii("⚡");          // Expected: 0xE29AA1 (14850721)

    receive () {}
}
