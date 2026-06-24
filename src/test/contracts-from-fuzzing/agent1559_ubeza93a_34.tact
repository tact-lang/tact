contract OnlyOptionalAddress {
    addr1: Address? = null;
    addr2: Address? = null;

    init() {
        self.addr1 = null;
        self.addr2 = null;
    }
}