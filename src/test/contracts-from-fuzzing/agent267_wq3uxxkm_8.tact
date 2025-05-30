struct SmallInts {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint1;
    d: Int as uint16;
}

contract SerializeEdge {
    packed: SmallInts;

    init() {
        self.packed = SmallInts{
            a: 3,
            b: -8,
            c: 1,
            d: 9999,
        };
    }
}