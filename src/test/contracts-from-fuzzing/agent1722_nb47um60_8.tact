contract WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = false;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "hello";
        self.d = 5;
        self.e = null;
    }
}