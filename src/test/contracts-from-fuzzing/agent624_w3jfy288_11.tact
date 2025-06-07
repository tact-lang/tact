contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "preset";

    init() {
        self.b = true;
    }
}