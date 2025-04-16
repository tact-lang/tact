contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "abc";
    d: Int?;
    e: Bool? = true;
    f: String? = null;

    init() {
        self.b = false;
        self.d = null;
    }
}