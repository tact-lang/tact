contract TestAddress() {
    receive() {
        // Using the built-in compile-time function to parse an address literal
        let addr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        dump(addr);
    }
}
