contract Test {
    // Test 13: Testing crc32() with an empty string
    // Per documentation, even though empty string isn't explicitly mentioned,
    // expected behavior: either a valid computed checksum or an error.
    // We need to see how the compiler handles it.
    val: Int = crc32("");
    receive() {}
}
