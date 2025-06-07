contract HugeNumberDefaults {
    a: Int = -999999999999999;
    b: Int = 999999999999999;
    c: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFF;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }
}