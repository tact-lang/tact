contract MixDefaults {
    a: Int = 10;
    b: String = "abc";
    c: Bool = true;
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.d = null;
        self.e = null;
        self.f = true;
    }
}