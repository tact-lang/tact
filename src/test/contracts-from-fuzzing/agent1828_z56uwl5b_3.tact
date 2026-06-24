contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "a";
    d: Int as uint8 = 8;
    e: Int as int16 = -16;
    f: String = "b";
    g: Bool = false;
    h: Int = 2;

    init() {
        self.a = 42;
        self.b = false;
        self.c = "changed";
        self.d = 0;
        self.e = 16;
        self.f = "updated";
        self.g = true;
        self.h = 99;
    }
}