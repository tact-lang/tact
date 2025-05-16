contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hi";
    d: Int?;
    e: Bool? = true;
    f: String?;

    init() {
        self.b = false;
        self.d = null;
        self.f = null;
    }
}