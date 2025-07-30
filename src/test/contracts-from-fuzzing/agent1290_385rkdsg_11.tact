contract WeirdOrder {
    a: Int as uint8;
    b: Bool;
    c: Int;
    d: String?;
    e: Int as int16;
    f: Bool;
    g: String;
    h: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 1000;
        self.d = null;
        self.e = -50;
        self.f = false;
        self.g = "hello";
        self.h = null;
    }

    receive() {
        self.a = 2;
        self.b = false;
        self.c = -1000;
        self.d = "x";
        self.e = 50;
        self.f = true;
        self.g = "world";
        self.h = 888;
    }
}