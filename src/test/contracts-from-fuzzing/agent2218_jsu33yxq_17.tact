contract Test {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int64;
    d: Int as uint64;
    
    init() {
        self.a = -5;
        self.b = 12;
        self.c = -5000;
        self.d = 10000;
    }
}