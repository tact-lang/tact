contract TestCrc32Empty {
    // Test compile-time function 'crc32' with an empty string
    checksum: Int = crc32("");

    receive() {
        // No runtime actions
    }
}
