contract MixedDefaultsOpts {
    a: Int = 5;
    b: Int?;
    c: String = "abc";
    d: String?;

    init() {
        self.b = null;
        self.d = null;
    }
}
