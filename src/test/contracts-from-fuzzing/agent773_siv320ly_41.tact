contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "foo";

    init() {
        self.b = true;
    }
}