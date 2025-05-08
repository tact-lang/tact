contract OrderTest {
    a: Int as uint8;
    b: Bool;
    c: Int as int16;
    d: String;
    e: Bool?;
    f: Int?;

    init() {
        self.a = 5;
        self.b = true;
        self.c = -2;
        self.d = "ok";
        self.e = false;
        self.f = null;
    }
}