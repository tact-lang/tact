const TEST_CRC: Int = crc32("000DEADBEEF000");

contract TestCRC() {
    get fun getCRC(): Int {
        return TEST_CRC; // expected 1821923098
    }
}
