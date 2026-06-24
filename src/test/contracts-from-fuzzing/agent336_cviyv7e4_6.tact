contract TestContract {
    a: Int = 0;
    b: Int as uint8 = 10;
    c: Int as int64 = -20;

    init() {
        self.a = 100;
        self.b = 255;
        self.c = -15;
    }
}