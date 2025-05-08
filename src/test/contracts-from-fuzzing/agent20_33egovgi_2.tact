contract ConstEvalTest() {
    // Built-in compile-time functions in constant declarations
    // ton("1") should evaluate to 1000000000 (1 Toncoin in nanoToncoin units)
    const TON_VAL: Int = ton("1");
    
    // ascii("⚡") should evaluate to 14850721
    const AS_INT: Int = ascii("⚡");

    // The crc32 function is also a compile-time function; here we add 10 for testing
    const CRC_SUM: Int = crc32("hello") + 10;

    receive() {
        // Check TON_VAL using contract-level constant via self reference
        require(self.TON_VAL == 1000000000, "ton('1') did not evaluate to 1000000000");

        // Check AS_INT using contract-level constant via self reference
        require(self.AS_INT == 14850721, "ascii('⚡') did not evaluate to 14850721");

        // Use CRC_SUM in a dummy expression to ensure it is evaluated
        let _ = self.CRC_SUM + self.TON_VAL + self.AS_INT;

        cashback(sender());
    }
}
