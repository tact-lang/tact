contract SerialOrderTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int256;
    d: Bool;
    e: String;

    init() {
        self.a = 5;
        self.b = 500;
        self.c = -1;
        self.d = true;
        self.e = "hi";
    }
}