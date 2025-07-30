contract TestAddress() {
    // Test compile-time evaluation of the address() built-in function
    // We expect the provided base64 address to be parsed into an Address constant.
    const ADDR: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    receive() {
        dump(self.ADDR);
    }
}
