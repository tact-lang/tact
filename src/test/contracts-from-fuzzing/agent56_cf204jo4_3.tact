contract TestConstant {
    // Contract-level constants are accessible via 'self'
    const A: Int = ascii("⚡");          // Expected: 14850721
    const B: Int = ton("1");             // Expected: 1000000000
    const C: Int = crc32("000DEADBEEF000"); // Expected: 1821923098

    // Function that dumps the constant values
    fun run() {
        dump(self.A); // Should dump 14850721
        dump(self.B); // Should dump 1000000000
        dump(self.C); // Should dump 1821923098
    }

    // Receiver function to trigger the evaluation
    receive() {
        self.run();
        cashback(sender());
    }
}
