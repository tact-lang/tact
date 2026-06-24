contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Bool;
    e: Int;
    f: Bool?;

    init() {
        self.a = 1;
        self.b = -10;
        self.c = 1000;
        self.d = true;
        self.e = 42;
        self.f = null;
    }

    receive() {
        self.a += 1;
        self.b -= 1;
        self.c += 100;
        self.d = !self.d;
        self.e *= 2;
        self.f = true;
    }
}