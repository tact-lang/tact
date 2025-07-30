contract TestAddress() {
    fun test() {
        // Obtain the address of the current contract
        let addr: Address = myAddress();
        // Parse the address into its components
        let std: StdAddress = parseStdAddress(addr.asSlice());
        dump(std.workchain); // expected output: 0 (for typical basechain address)
    }

    receive() {
        self.test();
    }
}
