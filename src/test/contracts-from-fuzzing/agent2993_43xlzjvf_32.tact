contract ManyDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Bool = true;
    s: String = "str";

    init() {
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.s = "zzz";
    }
}