contract Test {
    // Testing crc32 with empty string; expecting a valid compile-time evaluation (likely 0)
    val: Int = crc32("");
    
    receive() {}
}
