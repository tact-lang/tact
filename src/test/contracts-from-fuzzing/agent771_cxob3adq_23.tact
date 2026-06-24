contract OnlyDefaults {
    a: Int = 42;
    b: String = "hello";
    c: Bool = true;
    d: Int? = null;
    e: String? = null;

    init() {
        self.a = 7;
        self.b = "bye";
        self.c = false;
        self.d = 1;
        self.e = "exists";
    }
}