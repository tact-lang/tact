contract TestAddressExpr() {
    fun run() {
        // Testing address literal expression using address() function
        let addr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        // Dump the address to ensure it is correctly constructed
        dump(addr);
    }
    
    receive() {
        self.run();
    }
}
