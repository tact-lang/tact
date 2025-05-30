struct SerialStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint20;
    d: Int as int32;
    e: Int as uint64;
}

contract SerialStructStorage {
    s: SerialStruct;
    init() {
        self.s = SerialStruct{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5,
        };
    }
}