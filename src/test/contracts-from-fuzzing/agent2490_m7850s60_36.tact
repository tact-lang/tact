contract IntVariants {
    a: Int as uint8;
    b: Int as int12;
    c: Int as uint64;
    d: Int as int128;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}