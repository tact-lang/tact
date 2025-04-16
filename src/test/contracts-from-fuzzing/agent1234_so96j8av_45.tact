contract SerializedVars {
    a: Int as coins;
    b: Int as int8;
    c: Int as uint128;

    init() {
        self.a = ton("10");
        self.b = -7;
        self.c = 123456789;
    }
}