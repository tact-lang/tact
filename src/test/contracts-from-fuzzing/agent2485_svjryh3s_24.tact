contract MixedDefaults {
    a: Int = 42;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;

    init() {
        self.a = 1;
        self.b = null;
        self.c = false;
        self.d = null;
    }
}