contract TestCRC32 {
    // Using crc32 function with a known input
    checksum: Int = crc32("000DEADBEEF000");

    fun main(): Int {
        return self.checksum;
    }
}
