contract MixedDefaults {
    a: Int? = null;
    b: Int = 1;
    c: Bool? = null;
    d: Bool = true;

    init() {
        self.a = 2;
        self.b = 3;
        self.c = false;
        self.d = false;
    }
}