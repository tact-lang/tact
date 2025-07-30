contract FieldsOrdering {
    a: Int = 1;
    b: Bool = true;
    c: String = "1";
    d: Int as uint8 = 8;
    e: Bool = false;
    f: String = "2";
    g: Int = 3;

    init() {
        self.a = 11;
        self.b = false;
        self.c = "one";
        self.d = 255;
        self.e = true;
        self.f = "two";
        self.g = 33;
    }
}