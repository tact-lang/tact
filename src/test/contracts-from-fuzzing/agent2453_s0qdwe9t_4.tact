contract ManyPrimitiveFields {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    x: Bool?;

    init() {
        self.i = 123;
        self.b = false;
        self.s = "test";
        self.o = null;
        self.x = true;
    }
}