contract DefaultedInts {
    a: Int = -1;
    b: Int as int8 = 1;
    c: Int as uint8 = 255;

    init() {
        self.a = 5;
        self.b = 10;
        self.c = 20;
    }
}
