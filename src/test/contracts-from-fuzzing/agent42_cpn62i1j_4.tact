contract TestConst2 {
    // Global, contract-level constant evaluated at compile-time
    const computed: Int = ton("1") + ascii("⚡") + crc32("000DEADBEEF000");

    receive() {
        // Dump the computed constant using self.computed
        // Expected:
        // ton("1") = 1000000000
        // ascii("⚡") = 14850721
        // crc32("000DEADBEEF000") = 1821923098
        // Sum = 1000000000 + 14850721 + 1821923098 = 2836673819
        dump(self.computed);
        return;
    }
}
