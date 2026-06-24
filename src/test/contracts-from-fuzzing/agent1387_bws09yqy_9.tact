contract InitDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int;

    init() {
        self.c = 99;
        self.a = 11; // override
        self.b = false; // override
    }
}