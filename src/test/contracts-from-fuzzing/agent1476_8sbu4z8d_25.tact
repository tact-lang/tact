contract AllDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;

    init() {
        self.a = 7;
        self.b = true;
        self.c = "bye";
        self.d = 5;
        self.e = true;
    }
}