contract MixOptionalAndDefaults {
    a: Int? = null;
    b: Bool = true;
    s: String?;

    init() {
        self.a = 42;
        self.b = false;
        self.s = null;
    }
}