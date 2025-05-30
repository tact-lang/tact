contract ManyAddresses {
    addr1: Address;
    addr2: Address;
    addr3: Address;
    addr4: Address;
    addr5: Address;
    addr6: Address;

    init() {
        let a = myAddress();
        self.addr1 = a;
        self.addr2 = a;
        self.addr3 = a;
        self.addr4 = a;
        self.addr5 = a;
        self.addr6 = a;
    }
}
