contract MixedDefaults {
    i: Int = 1;
    s: String;
    b: Bool;
    optI: Int?;
    optS: String?;

    init() {
        self.s = "abc";
        self.b = false;
        self.optI = null;
        self.optS = null;
    }
}