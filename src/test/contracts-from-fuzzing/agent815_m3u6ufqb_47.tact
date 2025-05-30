contract MultipleSerial {
    a: Int as uint8;
    b: Int as int8;
    c: Int as coins;

    init() {
        self.a = 200;
        self.b = -10;
        self.c = 999999999;
    }
}