struct Ints {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint1;
    e: Int as int8;
}

contract IntSerialize {
    test: Ints;
    init() {
        self.test = Ints{a:1, b:2, c:3, d:1, e:-5};
    }
}