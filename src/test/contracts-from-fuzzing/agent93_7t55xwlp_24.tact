contract MixedDefaults {
    a: Int = 1;
    b: String;
    c: Bool = true;

    init() {
        self.b = "b";
    }
}