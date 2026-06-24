contract ManyAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
    a4: Address;
    a5: Address;

    init() {
        let a = myAddress();
        self.a1 = a;
        self.a2 = a;
        self.a3 = a;
        self.a4 = a;
        self.a5 = a;
    }
}
