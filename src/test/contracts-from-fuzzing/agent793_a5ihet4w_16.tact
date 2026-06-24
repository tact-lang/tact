contract TestContract {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int16;
    d: Int as int257;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }

    receive() {}
}