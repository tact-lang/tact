contract ManyBoolOptFields {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;

    init() {
        self.a = false;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = true;
    }
}