contract TestPrimitiveTypes {
    fun test() {
        // Test integer arithmetic and literals
        let a: Int = 3 / 2; // Expect 1 as per documentation rounding toward -∞ (same as 3/2 rounded down)
        dump(a); // Should dump 1

        // Test different numeral bases
        let dec = 1_000_000_000;
        let bin = 0b1_1111_1111;
        let oct = 0o7_5_5;
        let hex = 0xFF80_0000_0000;
        dump(dec);
        dump(bin);
        dump(oct);
        dump(hex);

        // Test boolean operations
        let b: Bool = true && !!(false || true);
        dump(b);

        // Test address and slice conversion
        let addr: Address = myAddress();
        let std: StdAddress = parseStdAddress(addr.asSlice());
        dump(std.workchain);
    }
    
    receive() {
        self.test();
    }
}
