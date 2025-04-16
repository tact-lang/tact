contract Test19 {
    a: Int as int4; // very small int
    b: Int as uint3; // very small uint
    c: Int as int8;
    d: Int as uint7;

    init() {
        self.a = 3;
        self.b = 7;
        self.c = -5;
        self.d = 100;
    }
}