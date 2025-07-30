contract StringsAndAddresses {
    s1: String;
    addr1: Address;

    init() {
        self.s1 = "hello";
        self.addr1 = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
}