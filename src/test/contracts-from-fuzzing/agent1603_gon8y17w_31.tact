contract IntDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Int = -1;
    d: Int = 999999999;

    init() {
        self.a = 42;
        self.b = 43;
        self.c = 44;
        self.d = 45;
    }
}