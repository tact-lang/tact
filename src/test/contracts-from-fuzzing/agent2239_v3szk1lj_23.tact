contract MixedDefaults {
    a: Int = 3;
    b: Bool;
    c: String = "abc";
    init() {
        self.b = true;
    }
}