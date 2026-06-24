contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = ton("1");
    }
}