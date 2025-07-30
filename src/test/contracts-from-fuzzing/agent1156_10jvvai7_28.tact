contract ManyAddresses {
    a: Address;
    b: Address;
    c: Address;

    init() {
        let addr = myAddress();
        self.a = addr;
        self.b = addr;
        self.c = addr;
    }
}