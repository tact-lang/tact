contract InitDefaults {
    a: Int = 1;
    b: String = "k";
    c: Bool = true;
    d: Int? = null;

    init() {
        self.a = 2;
        self.b = "x";
        self.c = false;
        self.d = null;
    }
}