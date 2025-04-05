contract TestAddress() {
    fun run() {
        let addr: Address = myAddress();
        let stdAddr: StdAddress = parseStdAddress(addr.asSlice());
        // Dump the workchain, expected 0 for most contracts
        dump(stdAddr.workchain);
    }
    receive() {
        self.run();
    }
}
