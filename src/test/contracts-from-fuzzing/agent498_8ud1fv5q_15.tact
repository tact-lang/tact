contract MixedDefaults {
    a: Int;
    b: Bool = true;
    s: String;
    o: Int?;
    init() {
        self.a = 7;
        self.s = "hello";
        self.o = null;
    }
}