contract FieldOrderTest {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
    d: String;
    e: Int?;
    f: String?;
    g: Bool?;

    init() {
        self.a = 1;
        self.b = -1000;
        self.c = true;
        self.d = "abc";
        self.e = null;
        self.f = "xyz";
        self.g = false;
    }
}