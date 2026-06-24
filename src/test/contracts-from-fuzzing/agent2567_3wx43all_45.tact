contract OptAddr {
    a: Address?;
    b: Address;

    init() {
        self.a = null;
        self.b = myAddress();
    }
}