contract MixOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.a = 7;
        self.b = true;
        self.s = "abc";
    }
}
