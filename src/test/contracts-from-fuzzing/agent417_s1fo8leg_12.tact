struct SizedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int?;
    d: Int as uint32;
    e: Int?;
    f: Int as int64;
}

contract TestContract {
    sints: SizedInts;
    
    init() {
        self.sints = SizedInts{
            a: 10,
            b: -100,
            c: null,
            d: 123456,
            e: 555,
            f: -999999
        };
    }
}