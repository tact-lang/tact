contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "abc";
    d: Bool = true;

    init() {
        self.b = false;
    }
}
