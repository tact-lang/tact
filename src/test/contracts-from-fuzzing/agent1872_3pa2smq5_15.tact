contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    s: String = "hi";

    init() {
        self.b = false;
    }
}