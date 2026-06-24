contract MixedDefaults {
    a: Int = 4;
    b: Bool;
    c: String = "hello";
    d: Int?;

    init() {
        self.b = true;
        self.d = null;
    }
}