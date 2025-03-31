contract TestValidAscii32 {
    // ASCII string of exactly 32 bytes
    val: Int = ascii("12345678901234567890123456789012");
    receive() {}
}
