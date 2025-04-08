contract MixedDefaults {
    a: Int = 42;
    b: Bool;
    c: String = "abc";
    d: Int? = null;
    e: Bool?;
    f: String? = null;

    init() {
        self.b = true;
        self.e = false;
    }
}