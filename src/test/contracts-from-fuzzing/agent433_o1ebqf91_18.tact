contract DefaultsAndNoDefaults {
    a: Int = 0;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;

    init() {
        self.b = true;
        self.c = "x";
        self.d = null;
        self.e = null;
    }
}