contract ChainsOfAddresses {
    addr1: Address;
    addr2: Address;
    addr3: Address;

    init() {
        let my = myAddress();
        self.addr1 = my;
        self.addr2 = my;
        self.addr3 = my;
    }
}