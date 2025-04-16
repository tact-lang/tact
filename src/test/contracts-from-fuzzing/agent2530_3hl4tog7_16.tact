contract MixOptDef {
    a: Int?;
    b: Int = 42;
    c: String?;
    d: String = "hi";
    e: Bool?;

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
    }
}