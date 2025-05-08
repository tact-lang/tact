contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "blah";
    d: Bool;
    e: String;

    init() {
        self.b = true;
        self.d = false;
        self.e = "str";
    }
}