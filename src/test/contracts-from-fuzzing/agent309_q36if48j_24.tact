contract MixedOptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: Int = 5;
    d: Bool = true;

    init() {
        self.a = null;
        self.b = null;
    }
}