contract MixOptionalDefaults {
    a: Int? = null;
    b: Bool?;
    c: String = "hello";
    d: Bool? = null;
    e: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.d = false;
        self.e = 42;
    }
}