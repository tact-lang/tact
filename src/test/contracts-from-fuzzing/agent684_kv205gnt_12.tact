contract TestContract {
    a: Int as uint8 = 1;
    b: Int as int16 = -5;
    c: Int as uint32 = 1234;

    init() {
        self.a = 2;
        self.b = -8;
        self.c = 5678;
    }

    receive() {
        dump(self.a);
        dump(self.b);
        dump(self.c);
    }
}
