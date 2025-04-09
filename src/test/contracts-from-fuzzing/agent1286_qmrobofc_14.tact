struct SerStruct {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract Serializations {
    s: SerStruct;

    init() {
        self.s = SerStruct{
            a: 5,
            b: -7,
            c: 600,
            d: 1000000,
            e: 9876543210
        };
    }
}