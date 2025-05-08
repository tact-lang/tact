struct VaryingInts {
    a: Int as int4;
    b: Int as uint5;
    c: Int as int1;
    d: Int as uint1;
    e: Int as int12;
    f: Int as uint20;
    g: Int as int64;
}

contract VaryingIntsContract {
    ints: VaryingInts;

    init() {
        self.ints = VaryingInts{
            a: -8,
            b: 15,
            c: -1,
            d: 1,
            e: 200,
            f: 100000,
            g: -50000000,
        };
    }
}