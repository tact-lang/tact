contract TestCombined() {
    // Testing a combination of compile-time functions: ascii and ton
    // ascii("a") should produce 97 and ton("0.000000001") should produce 1
    // Therefore, the constant COMB should be 98
    const COMB: Int = ascii("a") + ton("0.000000001");

    receive() {
        dump(self.COMB); // Expected output: 98
    }
}
