struct Ints {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint128;
}

contract SerializedInts {
    x: Ints;

    init() {
        self.x = Ints{
            a: 1,
            b: -2,
            c: 3,
        };
    }
}