contract TestCRC32() {
    // Getter returning the computed crc32 value of the string "000DEADBEEF000"
    // Expected value: 1821923098 (as per documentation example)
    get fun value() : Int {
        return crc32("000DEADBEEF000");
    }
}
