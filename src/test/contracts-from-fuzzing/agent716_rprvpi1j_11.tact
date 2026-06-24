contract MixedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String;
    d: Int?;
    e: Bool?;

    init() {
        self.c = "Hello";
        self.d = 100;
        self.e = null;
    }
}