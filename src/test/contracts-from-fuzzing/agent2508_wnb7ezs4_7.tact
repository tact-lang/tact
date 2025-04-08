contract NoDefaults {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 33;
        self.b = true;
        self.c = myAddress();
    }
}
