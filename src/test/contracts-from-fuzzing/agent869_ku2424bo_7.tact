contract NoDefaults {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 10;
        self.b = false;
        self.c = myAddress();
    }

    receive() {}
}
