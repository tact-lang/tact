contract MixWithDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: String?;

    init() {
        self.d = null;
        self.e = null;
    }
}
