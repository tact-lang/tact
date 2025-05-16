contract TestContract {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: String?;
    e: Int;
    f: Bool;
    g: Int as uint64;
    h: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = null;
        self.e = 5;
        self.f = false;
        self.g = 42;
        self.h = "Hello";
    }
}