contract MixedDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "yo";

    init() {
        self.b = true;
    }
}