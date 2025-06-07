contract DefaultInitOverrides {
    a: Int = 1;
    b: Bool = true;
    c: Address;

    init() {
        self.a = 42;
        self.b = false;
        self.c = myAddress();
    }
}