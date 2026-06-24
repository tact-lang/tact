contract MixedDefaults {
    a: Int = 40 + 2;
    b: Int = 1 << 3;
    c: Bool = true;
    d: String = "hi there";
    e: Int;

    init() {
        self.e = 99;
    }
}
