contract MixedDefaultsVars {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Bool;

    init() {
        self.b = true;
        self.d = false;
    }
}