struct Ints {
    a: Int;
    b: Int as int8;
    c: Int as int16;
    d: Int as int32;
    e: Int as uint8;
    f: Int as uint16;
    g: Int as uint32;
}

contract SerializedIntsTest {
    vals: Ints;

    init() {
        self.vals = Ints{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
            g: 7
        };
    }
}