contract ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Address?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = true;
        self.e = null;
    }
}