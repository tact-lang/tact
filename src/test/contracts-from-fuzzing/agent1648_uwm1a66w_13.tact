contract ManyNumerics {
    a: Int as int32;
    b: Int as uint32;
    c: Int as int257;
    d: Int as uint1;
    e: Int; // implicit 257-bit default serialization

    init() {
        self.a = -123;
        self.b = 456;
        self.c = 789;
        self.d = 1;
        self.e = -999;
    }
}