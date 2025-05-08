contract TestAddress() {
    // Constant computed at compile-time using the address built-in function
    const ADDR: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    receive() {
        dump(self.ADDR);
    }
}
