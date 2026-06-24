contract Test39 {
    addr: Address;
    optAddr: Address?;

    init() {
        self.addr = myAddress();
        self.optAddr = null;
    }
}