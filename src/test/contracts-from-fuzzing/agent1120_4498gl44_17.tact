contract LargeNumbers {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 100;
        self.b = -32000;
        self.c = ton("1.2345");
    }
}