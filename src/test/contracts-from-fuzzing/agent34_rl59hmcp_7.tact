contract TestAddress {
    fun test_address() {
        let addr: Address = myAddress();
        let std: StdAddress = parseStdAddress(addr.asSlice());
        dump(std.workchain); // expected: typically 0
        dump(std.address);   // expected: account id as Int
    }
    
    receive() {
        self.test_address();
    }
}
