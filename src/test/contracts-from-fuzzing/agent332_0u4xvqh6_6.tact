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
            a: 255,   // max uint8
            b: -128,  // min int8
            c: 65535, // max uint16
            d: -32768, // min int16
            e: 15     // max uint4
        };
    }
}