contract ManyAddresses {
    a: Address;
    b: Address;
    c: Address;
    d: Address;
    e: Address;

    init() {
        let addr = myAddress();
        self.a = addr;
        self.b = addr;
        self.c = addr;
        self.d = addr;
        self.e = addr;
    }
}
