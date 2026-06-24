contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hi";
    d: Bool = true;

    init() {
        self.b = false;
    }
}
