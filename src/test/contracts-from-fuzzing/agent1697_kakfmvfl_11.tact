contract AddressesAndStrings {
    addr1: Address;
    addr2: Address;
    str1: String;
    str2: String;

    init() {
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.str1 = "abc";
        self.str2 = "def";
    }
}