contract TinyInts {
    a: Int as uint1;
    b: Int as int2;
    c: Int as uint8;
    d: Bool = true;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 255;
        self.d = false;
    }

    receive() {
        let _ = self.c + 1;
    }
}