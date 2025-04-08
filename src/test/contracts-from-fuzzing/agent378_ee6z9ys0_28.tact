contract TestContract {
    a: Int as uint10 = 512;
    b: Int as int20 = -100;
    c: Int as uint50 = 123456;

    init() {
        self.a = 256;
        self.b = -50;
        self.c = 654321;
    }
}