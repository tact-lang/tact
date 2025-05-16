struct LongStruct {
    a: Int;
    b: Bool;
    c: Int as uint8;
    d: Bool;
    e: Int as uint16;
    f: Bool;
    g: Int as uint32;
    h: Bool;
    i: Int as uint64;
    j: Bool;
    k: Int as uint128;
    l: Bool;
    m: Int as uint256;
    n: Bool;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
            f: true,
            g: 4,
            h: false,
            i: 5,
            j: true,
            k: 6,
            l: false,
            m: 7,
            n: true
        };
    }
}