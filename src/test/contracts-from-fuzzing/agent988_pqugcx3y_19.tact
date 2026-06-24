contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hello";

    init() {
        self.b = true;
    }
}