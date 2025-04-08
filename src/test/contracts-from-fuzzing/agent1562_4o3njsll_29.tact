contract MixedDefaults {
    p: Int = 1;
    q: Int;
    r: Bool;
    s: String = "s";

    init() {
        self.q = 2;
        self.r = false;
    }
}
