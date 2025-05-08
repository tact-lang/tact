contract ManyBools {
    a: Bool = false;
    b: Bool = true;
    c: Bool? = null;
    d: Bool? = null;
    e: Bool? = null;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
        self.d = false;
        self.e = true;
    }
}