contract MixOptionalDefaults {
    a: Int? = null;
    b: Int?;
    c: Bool = true;
    d: Bool;
    e: String = "hi";
    f: String;

    init() {
        self.b = 10;
        self.d = false;
        self.f = "there";
    }
}