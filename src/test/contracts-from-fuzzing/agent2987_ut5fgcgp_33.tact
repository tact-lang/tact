contract BoolAndAddress {
    b: Bool;
    a: Address;

    init() {
        self.b = true;
        self.a = myAddress();
    }
}
