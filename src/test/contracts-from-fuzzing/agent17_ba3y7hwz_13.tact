contract TestAddress() {
    fun test() {
        // Obtain the address of the current contract
        let addr: Address = myAddress();
        // Parse the StdAddress structure from the address
        let std: StdAddress = parseStdAddress(addr.asSlice());
        // Dump the workchain; expected typically 0
        dump(std.workchain);
        // Dump the account identifier; a large integer
        dump(std.address);
    }
    receive() { self.test(); }
}
