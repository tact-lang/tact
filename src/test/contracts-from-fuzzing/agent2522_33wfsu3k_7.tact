contract TestContract {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;

    init() {
        self.a = 100;
        self.b = -50;
        self.c = 50000;
        self.d = -20000;
    }
}