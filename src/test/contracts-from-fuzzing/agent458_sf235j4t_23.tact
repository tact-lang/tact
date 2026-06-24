contract OptionalAddress {
    optAddr1: Address?;
    optAddr2: Address?;

    init() {
        self.optAddr1 = myAddress();
        self.optAddr2 = null;
    }
}