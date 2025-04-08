contract RefsStorage {
    s1: String;
    s2: String;
    addr1: Address;
    addr2: Address;
    s3: String;

    init() {
        self.s1 = "alpha";
        self.s2 = "beta";
        self.s3 = "gamma";
        self.addr1 = myAddress();
        self.addr2 = myAddress();
    }
}