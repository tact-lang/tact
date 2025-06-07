contract EmptyDefaults {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 0;
        self.b = false;
        self.c = myAddress();
    }
}
