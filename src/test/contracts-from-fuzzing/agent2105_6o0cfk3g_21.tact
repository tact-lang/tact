contract MixedDefaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool? = null;

    init() {
        self.a = 42;
        self.b = "world";
        self.c = true;
    }
}