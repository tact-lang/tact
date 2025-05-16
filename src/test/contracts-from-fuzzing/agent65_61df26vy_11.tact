contract TestAddress() {
    fun test() {
        // Obtain the address of the current contract
        let addr: Address = myAddress();
        // Parse the standard address to get workchain and account id
        let std: StdAddress = parseStdAddress(addr.asSlice());
        // Dump the workchain and account id (account id is a huge number)
        dump(std.workchain); // Expected typically 0
        dump(std.address);   // Expected a large number
    }
    receive() { self.test(); }
}
