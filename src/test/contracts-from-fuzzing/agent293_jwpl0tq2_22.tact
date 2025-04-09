contract SimpleDefaults {
    i: Int = 42;
    b: Bool = true;
    s: String = "default";

    init() {
        self.i = 42;
        self.b = true;
        self.s = "default";
    }
}