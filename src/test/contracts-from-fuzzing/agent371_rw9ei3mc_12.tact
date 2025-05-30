contract ManyOptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Int = 0;
    d: Bool = false;

    init() {
        self.a = null;
        self.b = null;
        self.c = 42;
        self.d = true;
    }
}