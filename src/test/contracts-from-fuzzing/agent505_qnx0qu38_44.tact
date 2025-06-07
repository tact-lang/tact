contract IntSerializations {
    a: Int as uint3 = 5;
    b: Int as int5 = -7;
    c: Int as uint6 = 33;

    init() {
        self.a = 2;
        self.b = -3;
        self.c = 15;
    }

    receive() {
        self.a = self.a + 1;
    }
}