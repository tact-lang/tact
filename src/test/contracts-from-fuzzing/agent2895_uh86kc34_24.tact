contract OptionalAddresses {
    addr1: Address?;
    addr2: Address?;
    addr3: Address?;

    init() {
        self.addr1 = null;
        self.addr2 = null;
        self.addr3 = null;
    }
}
