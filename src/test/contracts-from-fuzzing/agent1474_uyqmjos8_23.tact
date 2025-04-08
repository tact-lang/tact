struct SerialSizes {
    s1: Int as uint8;
    s2: Int as uint16;
    s3: Int as uint32;
    s4: Int as int16;
    s5: Int as int64;
}

contract Test22 {
    se: SerialSizes;
    init() {
        self.se = SerialSizes{
            s1: 1,
            s2: 300,
            s3: 70000,
            s4: -123,
            s5: 123456789
        };
    }
}