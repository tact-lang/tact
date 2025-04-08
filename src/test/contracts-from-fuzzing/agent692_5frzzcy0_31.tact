contract MixOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = "ok";
    }
}