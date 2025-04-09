contract MultipleAddresses {
    addr1: Address;
    addr2: Address;
    addr3: Address;

    init() {
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.addr3 = myAddress();
    }
}
