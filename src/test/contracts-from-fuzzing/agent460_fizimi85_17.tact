contract MixedInitAndDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
    d: Int;
    e: Bool;

    init() {
        self.d = 99;
        self.e = true;
    }
}