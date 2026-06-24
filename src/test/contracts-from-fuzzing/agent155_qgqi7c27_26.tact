contract SerializeSmalls {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int;

    init() {
        self.a = 5;
        self.b = 200;
        self.c = -300;
        self.d = 123;
    }
}