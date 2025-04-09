contract LargeTyped {
    a: Int as uint64;
    b: Int as int128;
    c: Int;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 42;
    }
}