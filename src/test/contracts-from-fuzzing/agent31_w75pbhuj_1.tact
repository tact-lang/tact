contract TestConstants() {
    // Getter returns 1 Toncoin in nanoToncoins: expected 1000000000
    get fun getTon(): Int {
        return ton("1");
    }

    // Getter returns ascii value of "⚡": expected 14850721 (or 0xE29AA1)
    get fun getAscii(): Int {
        return ascii("⚡");
    }

    // Getter returns crc32 of "000DEADBEEF000": expected 1821923098
    get fun getCrc32(): Int {
        return crc32("000DEADBEEF000");
    }
}
