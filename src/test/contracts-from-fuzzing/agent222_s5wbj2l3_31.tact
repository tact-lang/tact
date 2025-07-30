contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "zzz";

    init() {
        self.b = true;
    }
}