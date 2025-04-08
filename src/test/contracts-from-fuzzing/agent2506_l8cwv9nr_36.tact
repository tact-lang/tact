// Struct with diverse primitive serialization
struct IntSer {
    a: Int as int4;
    b: Int as uint12;
    c: Int as int64;
    d: Int;
}

contract SerializeTest {
    s: IntSer;
    init() {
        self.s = IntSer{
            a: 5,
            b: 1234,
            c: 11111,
            d: 9876543
        };
    }
}
