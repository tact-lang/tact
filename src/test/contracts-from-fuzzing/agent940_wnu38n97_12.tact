contract TestContract {
    a: Int as uint8 = 1;
    b: Int as int16 = -2;
    c: Int as coins = 1000;
    d: Int = 5;

    init() {
        self.a = 2;
        self.b = -3;
        self.c = 2000;
        self.d = 10;
    }
}