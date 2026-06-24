contract MixDefaults {
    a: Int = 1;
    b: Int;
    c: String = "foo";
    d: Bool;

    init() {
        self.b = 2;
        self.d = true;
    }
}