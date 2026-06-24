contract TestContract {
    a: Int as int64;
    b: Int as uint8;
    c: Int as int128;
    d: Int?;
    e: Bool;

    init() {
        self.a = 123;
        self.b = 255;
        self.c = -456;
        self.d = null;
        self.e = true;
    }
}