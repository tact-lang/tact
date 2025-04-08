contract MixedDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;

    init() {
        self.d = 10;
        self.e = true;
    }
}
