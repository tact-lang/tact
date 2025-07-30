contract OnlyAddress {
    addr: Address;
    init() {
        self.addr = myAddress();
    }
}
