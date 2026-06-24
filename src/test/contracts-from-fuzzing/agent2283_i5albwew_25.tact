contract InitOverrideDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "str";

    init() {
        self.a = 100;
        self.b = false;
        self.c = "overridden";
    }
}
