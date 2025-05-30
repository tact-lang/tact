contract CrcTest() {
    // Compile-time constant: using crc32 built-in function
    // According to documentation, crc32("000DEADBEEF000") should evaluate to 1821923098.
    const crcValue: Int = crc32("000DEADBEEF000");

    // Function to return the compile-time computed crc32 value.
    fun getCrc(): Int {
        return self.crcValue;
    }

    receive() {}
}
