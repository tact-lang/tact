contract ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = 2;
        self.e = null;
    }
}
