const TEST_CRC: Int = crc32("000DEADBEEF000");

contract TestCrc() {
    receive() {
        dump(TEST_CRC); // Expected output: 1821923098
    }
}
