contract MixedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int? = null;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "hi";
        self.d = null;
    }
}