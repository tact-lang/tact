contract Test {
    a: Int as uint8;
    b: Int as int32;
    c: Int?;
    d: Bool?;

    init() {
        self.a = 5;
        self.b = -1234;
        self.c = null;
        self.d = true;
    }
}