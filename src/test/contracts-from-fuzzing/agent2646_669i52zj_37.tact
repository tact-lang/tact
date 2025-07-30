contract MultipleAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
    a4: Address;
    a5: Address;
    init() {
        let addr = myAddress();
        self.a1 = addr;
        self.a2 = addr;
        self.a3 = addr;
        self.a4 = addr;
        self.a5 = addr;
    }
    receive() {}
}