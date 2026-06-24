contract ScalarDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";

    init() {
        self.a = 10;
        self.b = false;
        self.c = "override";
    }
}