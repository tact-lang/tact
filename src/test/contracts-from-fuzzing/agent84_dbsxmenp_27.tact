contract LargeIntsPow {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    init() {
        self.a = 0;
        self.b = 10000;
        self.c = -5000;
        self.d = pow(2,100);
        self.e = -pow(2,100);
    }
}
