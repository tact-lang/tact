contract TestContract {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint8;
    d: Int as uint32;

    init() {
        self.a = -100;
        self.b = 2000;
        self.c = 250;
        self.d = 3000000000;
    }
}