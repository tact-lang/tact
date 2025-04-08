contract ContractOptAddrs {
    a: Address?;
    b: Address?;

    init() {
        self.a = null;
        self.b = myAddress();
    }
}