contract TestContract {
    a: Int as uint8 = 0;
    b: Int as int16 = 0;
    c: Int as coins = 0;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 1000;
    }
}