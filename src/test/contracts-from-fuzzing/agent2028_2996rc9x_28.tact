contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hello";
    d: Bool? = null;
    e: String? = "bye";

    init() {
        self.b = true;
        self.d = true;
    }
}
