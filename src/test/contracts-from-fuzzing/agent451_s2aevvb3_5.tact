struct ManyFields {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint64;
    g: Int;
    h: Bool;
    i: Bool;
    j: Int as uint4;
    k: Int as int4;
    l: Bool;
}

contract ManyFieldsTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
            g: 7,
            h: true,
            i: false,
            j: 8,
            k: -3,
            l: true,
        };
    }
}