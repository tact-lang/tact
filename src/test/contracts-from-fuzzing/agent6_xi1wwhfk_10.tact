contract TestAddressExpr() {
    fun test() {
        // Testing Address expressions: get current contract address and parse it
        let addr: Address = myAddress();
        let std: StdAddress = parseStdAddress(addr.asSlice());
        // Dump the workchain part of the address
        dump(std.workchain);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
