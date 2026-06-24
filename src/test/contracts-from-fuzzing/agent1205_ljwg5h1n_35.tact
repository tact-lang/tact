contract ManyAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
    a4: Address;
    a5: Address;
    a6: Address;
    a7: Address;
    a8: Address;

    init() {
        self.a1 = myAddress();
        self.a2 = myAddress();
        self.a3 = myAddress();
        self.a4 = myAddress();
        self.a5 = myAddress();
        self.a6 = myAddress();
        self.a7 = myAddress();
        self.a8 = myAddress();
    }
}