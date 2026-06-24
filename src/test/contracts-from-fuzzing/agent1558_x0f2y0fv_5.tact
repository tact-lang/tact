contract FieldOrderTest {
    a: Int as uint8;
    b: Int;
    c: Bool;
    d: String;
    e: Bool?;
    f: String?;
    g: Int?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "ok";
        self.e = false;
        self.f = null;
        self.g = 100;
    }
}