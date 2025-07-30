contract DefaultDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;

    init() {
        self.a = 42;
        self.b = "hello";
        self.c = true;
    }
}
