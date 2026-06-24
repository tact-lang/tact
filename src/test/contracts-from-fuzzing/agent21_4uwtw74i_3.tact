contract TestConst() {
    // Define contract-level constants evaluated at compile-time
    const TON1: Int = ton("1");         // Expected: 1,000,000,000 nanoToncoin
    const CR: Int = crc32("000DEADBEEF000"); // Expected: 1821923098
    const AS: Int = ascii("⚡");          // Expected: 14850721

    // Getter to check TON1 constant
    get fun check_ton1() : Int {
        require(self.TON1 == 1000000000, "TON1 mismatch");
        return self.TON1;
    }

    // Getter to check crc32 constant
    get fun check_crc32() : Int {
        require(self.CR == 1821923098, "crc32 mismatch");
        return self.CR;
    }

    // Getter to check ascii constant
    get fun check_ascii() : Int {
        require(self.AS == 14850721, "ascii mismatch");
        return self.AS;
    }

    // A simple receiver so that the contract is fully compiled
    receive() {
        // Do nothing
    }
}
