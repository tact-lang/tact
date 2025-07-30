contract InitSomeDefaults {
    a: Int = 10;
    b: Bool = true;
    c: Address;

    init() {
        self.c = myAddress();
        self.a = 20; // overrides default
    }
}
