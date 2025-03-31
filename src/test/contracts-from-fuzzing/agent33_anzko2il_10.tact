contract TestAsciiMulti {
    // 9 Unicode code points of 4 bytes each = 36 bytes, exceeding the allowed 32 bytes
    a: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡");

    receive() {}
}
