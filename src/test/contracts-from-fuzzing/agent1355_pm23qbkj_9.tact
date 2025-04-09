contract MixOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: String;
    e: Int;
    f: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = "go";
        self.e = 11;
        self.f = null;
    }
}