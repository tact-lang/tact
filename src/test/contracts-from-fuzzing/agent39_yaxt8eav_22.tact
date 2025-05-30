contract EdgeSerialization {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int257;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = 42;
    }
}