struct S1 {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
}

contract SerializedVars {
    var1: S1;

    init() {
        self.var1 = S1{
            a: 5,
            b: -123,
            c: 1234,
            d: -123456,
            e: 1000000,
        };
    }
}
