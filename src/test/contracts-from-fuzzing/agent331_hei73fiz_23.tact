contract OptsAndDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool = true;

    init() {
        self.a = null;
        self.b = null;
        self.c = false;
    }
}