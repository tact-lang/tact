contract ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "abc";
    init() {
        self.a = 3;
        self.b = 4;
        self.c = false;
        self.d = "def";
    }
}