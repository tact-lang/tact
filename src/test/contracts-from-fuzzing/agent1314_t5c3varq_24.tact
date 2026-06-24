contract AddressHeavy {
    a: Address;
    b: Address?;
    c: Address;
    d: Address?;
    e: Address;

    init() {
        self.a = myAddress();
        self.b = null;
        self.c = myAddress();
        self.d = null;
        self.e = myAddress();
    }
}