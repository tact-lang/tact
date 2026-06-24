contract TestOverflow() {
    fun testOverflow(): Int {
        try {
            // Construct a cell that will overflow: 4 times 250 = 1000 bits + 24 bits = 1024 bits (overflow)
            let cell = beginCell()
                .storeInt(0, 250)
                .storeInt(0, 250)
                .storeInt(0, 250)
                .storeInt(0, 250)
                .storeUint(0, 24)
                .endCell();
            return 0; // if no error occurred
        } catch (exitCode) {
            // Expected exit code 8 for cell overflow
            return exitCode;
        }
    }

    get fun res(): Int {
        return self.testOverflow();
    }

    receive() {
        let _ = self.res();
        cashback(sender());
    }
}
