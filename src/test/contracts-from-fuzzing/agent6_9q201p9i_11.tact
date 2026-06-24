contract TestAddress() {
    // Constant evaluated at compile-time using the address built-in function
    // This address literal is a valid TON address string
    const addr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    receive() {
        // Access the constant via self
        dump(self.addr);
        cashback(sender());
    }
}
