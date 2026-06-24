contract NullableAddrs {
    a: Address?;
    b: Address?;

    init() {
        self.a = myAddress();
        self.b = null;
    }
}