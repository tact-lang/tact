contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "str";
    d: Bool;

    init() {
        self.b = true;
        self.d = false;
    }
}
