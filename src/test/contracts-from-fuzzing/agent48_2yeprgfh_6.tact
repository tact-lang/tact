contract Test {
    // Testing compile-time function 'crc32' with an empty string
    checksum: Int = crc32("");

    // Ensuring the contract is fully compiled
    receive() {}
}
