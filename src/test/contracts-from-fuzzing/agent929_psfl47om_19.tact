struct SmallInts {
    v4: Int as int4;
    v8: Int as int8;
    u8: Int as uint8;
    v16: Int as int16;
}

contract SmallIntStruct {
    s: SmallInts;

    init() {
        self.s = SmallInts{
            v4: -8,
            v8: -128,
            u8: 255,
            v16: 32767
        };
    }
}