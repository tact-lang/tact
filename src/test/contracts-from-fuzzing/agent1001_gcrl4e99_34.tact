contract WeirdDefaults {
    a: Int = -123;
    b: Bool = true;
    c: String = "initial";
    d: Int? = null;

    init() {
        self.a = -555;
        self.b = false;
        self.c = "changed";
        self.d = 42;
    }
}