contract StructWithAddress {
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}