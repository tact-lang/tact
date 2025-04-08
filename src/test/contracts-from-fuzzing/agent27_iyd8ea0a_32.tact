contract MixedOptionsAndDefaults {
    a: Int = 1;
    b: Bool?;
    c: String = "abc";
    d: Int?;

    init() {
        self.b = null;
        self.d = null;
    }
}