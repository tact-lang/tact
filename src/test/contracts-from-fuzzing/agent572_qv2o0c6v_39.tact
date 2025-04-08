contract PersistentAddress {
    addr: Address;
    init() {
        self.addr = myAddress();
    }
}