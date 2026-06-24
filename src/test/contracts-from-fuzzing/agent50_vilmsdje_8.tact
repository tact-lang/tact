contract TestAddress {
    // Test constant evaluation of the built-in address function, which converts a string literal into an Address.
    // This is a compile-time-only function.
    const ADDR: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    receive() {
        // Dump the computed address
        dump(self.ADDR);
    }
}
