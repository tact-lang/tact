contract SerializeIntFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int257;

    init() {
        self.a = -100;
        self.b = 123456;
        self.c = 789;
    }
}
