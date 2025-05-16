contract TestCRC32() {
    get fun test_crc32(): Int {
        return crc32("000DEADBEEF000");
    }
}
