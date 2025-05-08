struct LongPrimitives {
    a: Int;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint64;
    g: Int as int128;
    h: Int as uint256;
    i: Bool;
    j: Bool;
}

contract TestContract {
    data: LongPrimitives;

    init() {
        self.data = LongPrimitives{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: true, j: false
        };
    }
}