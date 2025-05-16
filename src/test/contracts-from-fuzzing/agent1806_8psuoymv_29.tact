contract MixedOptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 7;
    e: Bool = false;
    f: String = "hey";
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}