contract OptsAndDefaults {
    i: Int?;
    b: Bool = true;
    s: String?;

    init() {
        self.i = null;
        self.b = false;
        self.s = null;
    }
}