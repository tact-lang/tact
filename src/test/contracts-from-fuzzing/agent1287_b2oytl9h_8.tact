contract SingleAddressFieldInit {
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}