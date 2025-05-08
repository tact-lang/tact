contract MixedInitialDefaults {
    a: Int = 1;
    b: Bool;
    c: String? = null;
    d: Int?;
    e: Bool? = null;

    init() {
        self.b = true;
        self.d = 42;
    }
}