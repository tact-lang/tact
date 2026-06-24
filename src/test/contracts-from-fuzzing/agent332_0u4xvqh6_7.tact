struct SmallInts {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint4;
}

contract TestContract {
    si: SmallInts;

    init() {
        self.si = SmallInts{
            a: 255,
            b: -128,
            c: 65535,
            d: -32768,
            e: 20          // invalid, over max (15)
        };
    }
}