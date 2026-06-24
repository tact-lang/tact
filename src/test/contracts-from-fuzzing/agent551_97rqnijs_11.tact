struct StressStruct {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int as int64;
    h: Int as uint64;
    flag1: Bool;
    flag2: Bool;
    txt: String;
}

contract TestContract {
    big: StressStruct;
    init() {
        self.big = StressStruct{
            a: -1,
            b: 255,
            c: -1234,
            d: 65535,
            e: -123456,
            f: 4294967295,
            g: -1234567890,
            h: 1234567890,
            flag1: true,
            flag2: false,
            txt: "serialize",
        };
    }
}