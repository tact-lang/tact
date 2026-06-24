contract ComplexDefaults {
    a: Int = 5;
    b: Bool? = null;
    c: String = "abc";
    d: String? = null;
    e: Int? = 42;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "def";
        self.d = null;
        self.e = null;
    }
}