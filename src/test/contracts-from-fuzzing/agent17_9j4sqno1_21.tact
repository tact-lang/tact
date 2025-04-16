struct ManyAscriptions {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
}

contract TestAscription {
    st: ManyAscriptions;

    init() {
        self.st = ManyAscriptions{
            a: 5,
            b: -10,
            c: 200,
            d: 3000000,
            e: -1234567,
            f: 1234567890
        };
    }
}