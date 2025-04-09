contract IntVariousSerializations {
    a: Int as uint1;
    b: Int as int257;
    c: Int;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 999999;
    }
}