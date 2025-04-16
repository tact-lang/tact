contract TestConstants() {
    fun test() {
        dump(ASCIIVAL);   // expected: 14850721
        dump(TONVAL);     // expected: 1000000000
        dump(CRC32VAL);   // expected: 1821923098
    }
}

const ASCIIVAL: Int = ascii("⚡");
const TONVAL: Int = ton("1");
const CRC32VAL: Int = crc32("000DEADBEEF000");