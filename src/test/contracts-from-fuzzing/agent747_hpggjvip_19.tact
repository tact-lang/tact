contract DefaultsAndNoDefaults {
    a: Int;
    b: Bool = false;
    c: String;
    d: Int?;
    e: Bool?;

    init() {
        self.a = 0;
        self.c = "ok";
        self.d = null;
        self.e = null;
    }
}