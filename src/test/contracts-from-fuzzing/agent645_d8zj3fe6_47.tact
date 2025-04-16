contract InitDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";

    init() {
        self.a = 123;
        self.b = true;
        self.s = "xyz";
    }
}
