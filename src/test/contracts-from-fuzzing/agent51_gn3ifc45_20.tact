contract MixOptionalDefaults {
    a: Int? = null;
    b: Int?;
    c: Int = 5;
    d: Int;
    init() {
        self.b = null;
        self.d = 42;
    }
}
