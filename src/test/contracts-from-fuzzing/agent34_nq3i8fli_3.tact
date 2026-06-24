const CONST_CRC32: Int = crc32("000DEADBEEF000");

contract TestCRC32() {
    receive() {
        // expected value: 1821923098
        dump(CONST_CRC32);
    }
}
