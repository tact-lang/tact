struct Ints1 {
    a: Int as int64;
    b: Int as uint64;
}

struct Ints2 {
    c: Int as int32;
    d: Int as uint32;
}

contract SerialMix {
    i1: Ints1;
    i2: Ints2;

    init() {
        self.i1 = Ints1{ a: -1000, b: 1000 };
        self.i2 = Ints2{ c: -500, d:500 };
    }
}