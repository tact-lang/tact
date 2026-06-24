contract LongStringsAndAddresses {
    longStr: String;
    addr1: Address;
    addr2: Address;
    addr3: Address;

    init() {
        self.longStr = "This is an unusually long string just to test the persistent storage handling of strings";
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.addr3 = myAddress();
    }
}
