contract ConstAddressTest() {
    // Test compile-time evaluation of the address() function.
    // The documentation states that address() can be used at compile-time to produce an Address value.
    const ADDR: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    receive() {
        // Compare the constant with another invocation of address() with the same string literal.
        require(self.ADDR == address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2"), "ADDRESS constant mismatch");
        cashback(sender());
    }
}
