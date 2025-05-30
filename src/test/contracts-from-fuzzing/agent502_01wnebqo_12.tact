contract TestContract {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;
    
    init() {
        self.a = -42;
        self.b = 65535;
        self.c = 1000000000;
    }
}