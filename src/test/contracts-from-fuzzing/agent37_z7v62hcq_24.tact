contract Test {
    addr1: Address;
    addr2: Address?;
    addr3: Address;
    addr4: Address?;
    init() {
        self.addr1 = myAddress();
        self.addr2 = null;
        self.addr3 = myAddress();
        self.addr4 = null;
    }
}