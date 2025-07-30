contract ExplicitDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";

    init() {
        self.a = 5;
        self.b = true;
        self.s = "abc";
    }
}