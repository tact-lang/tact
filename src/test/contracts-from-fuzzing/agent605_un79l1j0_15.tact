struct Ints {
    a: Int as int64;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
}

contract SerializedInts {
    x: Ints;

    init() {
        self.x = Ints{
            a: 10,
            b: 20,
            c: 30,
            d: 40
        };
    }
}