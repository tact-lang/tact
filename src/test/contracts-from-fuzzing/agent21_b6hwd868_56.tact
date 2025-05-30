contract MixedPreset {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Int?;
    e: String = "abc";
    f: String?;

    init() {
        self.b = null;
        self.d = null;
        self.f = null;
    }
}