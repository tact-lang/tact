contract LotsOfAddress {
    a: Address;
    b: Address;
    c: Address;
    init() {
        self.a = myAddress();
        self.b = myAddress();
        self.c = myAddress();
    }
}