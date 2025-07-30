contract TestAsciiUnicodeOver {
    // 9 Unicode characters "⚡"; each usually occupies 3 bytes, but documented behavior limits to 8 Unicode code points (4 bytes each)
    value: Int = ascii("⚡⚡⚡⚡⚡⚡⚡⚡⚡");

    receive() {}
}
