contract MixedDefaults {
    a: Int = 7;
    b: Bool;
    c: Int? = null;
    d: String;

    init() {
        self.b = false;
        self.d = "bye";
    }
}
