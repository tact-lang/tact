contract ComplexDefaultsOverride {
    i: Int = 5;
    b: Bool = true;
    s: String = "hello";

    init() {
        self.i = 10;
        self.b = false;
        self.s = "world";
    }
}