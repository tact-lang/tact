contract SingleAddress {
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}