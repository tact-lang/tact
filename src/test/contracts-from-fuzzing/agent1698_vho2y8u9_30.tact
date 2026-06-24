contract IntDefaults {
    a: Int = 0;
    b: Int = -1;
    c: Int = 999999999;
    d: Int = -999999999;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}