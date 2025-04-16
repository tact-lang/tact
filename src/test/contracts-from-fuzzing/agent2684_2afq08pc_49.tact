contract MixAllDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.d = 5;
        self.e = true;
        self.f = "ok";
    }
}
