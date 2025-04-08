contract OnlyAddresses {
    a1: Address;
    a2: Address?;
    a3: Address;
    a4: Address?;

    init() {
        self.a1 = myAddress();
        self.a2 = null;
        self.a3 = myAddress();
        self.a4 = null;
    }
}
