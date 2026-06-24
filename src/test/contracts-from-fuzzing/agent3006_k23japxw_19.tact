contract InitDefaults {
    a: Int = 5;
    b: String = "x";
    c: Bool = true;
    d: Int?;

    init() {
        self.a = 10;
        self.b = "y";
        self.c = false;
        self.d = null;
    }
}
