contract TestAsciiValid {
    // Test ascii: Valid usage with single ASCII character and Unicode symbol
    a: Int = ascii("a");            // expected to produce integer 97
    b: Int = ascii("⚡");          // expected to produce 14850721 (0xE29AA1) 

    receive () {}
}
