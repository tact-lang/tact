struct SerializedInts {
    a: Int;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int64;
    e: Int as uint256;
}

contract IntSerialization {
    field: SerializedInts;

    init() {
        self.field = SerializedInts{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}
