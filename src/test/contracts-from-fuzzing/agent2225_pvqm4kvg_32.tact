contract AddressAndString {
    addr: Address;
    str: String;

    init() {
        self.addr = myAddress();
        self.str = "hi";
    }
}