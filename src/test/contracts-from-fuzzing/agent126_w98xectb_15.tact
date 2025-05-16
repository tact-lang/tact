contract ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
    c: Int = 7;

    init() {
        self.a = 2;
        self.b = true;
        self.s = "bye";
        self.c = 8;
    }
}