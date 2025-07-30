contract MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Int;
    e: Bool = false;

    init() {
        self.b = true;
        self.d = 42;
    }
}