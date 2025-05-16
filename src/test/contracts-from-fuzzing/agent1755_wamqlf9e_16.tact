contract MixedDefaults {
    a: Int = 5;
    b: String = "str";
    c: Bool;
    d: Int;
    init() {
        self.c = true;
        self.d = 42;
    }
}