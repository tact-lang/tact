contract ConstantTestFixed {
    // Combine compile-time evaluated constants
    // ton("1") returns 1000000000 (1e9) nanoToncoins
    // ascii("⚡") returns 14850721 (0xE29AA1) for the lightning bolt
    // crc32("000DEADBEEF000") returns 1821923098
    // Sum: 1000000000 + 14850721 + 1821923098 = 2836773819
    const combined: Int = ton("1") + ascii("⚡") + crc32("000DEADBEEF000");
    
    // A getter to read the combined constant; must access via self
    get fun getCombined() : Int {
        return self.combined;
    }
}
