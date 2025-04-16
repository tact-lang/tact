contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: Bool?;
    d: Int?;

    init() {
        self.b = true;
        self.c = null;
        self.d = null;
    }
}