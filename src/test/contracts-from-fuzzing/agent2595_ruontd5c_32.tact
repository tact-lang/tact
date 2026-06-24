contract MixedNullDefaults {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: String = "";

    init() {
        self.a = null;
        self.c = null;
    }
}