contract ChainAddress {
    addr1: Address;
    addr2: Address;
    s: String;
    b: Bool;

    init() {
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.s = "addr";
        self.b = true;
    }
}