contract SerialFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 5;
        self.b = -20;
        self.c = 1000000;
    }

    receive() {}
}