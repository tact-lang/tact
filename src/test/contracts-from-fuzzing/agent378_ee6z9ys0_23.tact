contract TestContract {
    a: Int as uint3 = 3;
    b: Int as uint5 = 17;
    c: Int as uint8 = 200;
    d: Int as uint16 = 1000;

    init() {
        self.a = 2;
        self.b = 5;
        self.c = 123;
        self.d = 32000;
    }
}