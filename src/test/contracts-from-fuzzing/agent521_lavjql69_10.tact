struct SerializedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as int257;
}

contract SerializedContract {
    s: SerializedInts;

    init() {
        self.s = SerializedInts{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5,
        };
    }
}