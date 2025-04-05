contract TestAddressConst {
    // Tests compile-time evaluation of address literal using the built-in address() function
    // The expected behavior is that address() converts a valid base64 TON address to an Address constant at compile time.
    const ADDR: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    fun run() {
        // Dumping the constant; note that the actual printed value may be complex,
        // but this verifies that evaluation succeeded.
        dump(self.ADDR);
    }

    receive() {
        self.run();
        cashback(sender());
    }
}
