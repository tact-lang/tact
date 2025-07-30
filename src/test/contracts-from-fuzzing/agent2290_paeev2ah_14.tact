contract Test14 {
    addr1: Address;
    addr2: Address?;

    init() {
        self.addr1 = myAddress();
        self.addr2 = null;
    }
}