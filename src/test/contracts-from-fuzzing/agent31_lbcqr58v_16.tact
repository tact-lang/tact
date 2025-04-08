// Testing very long list of different sized Int serialization formats
struct WeirdInts {
    a: Int as int8;
    b: Int as uint7;
    c: Int as int12;
    d: Int as uint13;
    e: Int as int64;
    f: Int as uint64;
    g: Int as int128;
    h: Int as uint128;
    i: Int as int257;
}

contract Test {
    val: WeirdInts;
    init() {
        self.val = WeirdInts{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f:6,
            g:7,
            h:8,
            i:9
        };
    }
}