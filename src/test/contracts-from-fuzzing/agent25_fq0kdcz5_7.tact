contract Test {
    // Valid ascii tests
    a: Int = ascii("a");            // one byte, expected: 97
    b: Int = ascii("⚡");          // lightning bolt, typically 3 bytes, expected value from concatenation of its UTF-8 bytes

    receive () {}
}
