struct SeveralSerializations {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Int as uint1;
    e: Int as int257;
}

contract SerializationVariety {
    s: SeveralSerializations;

    init() {
        self.s = SeveralSerializations{
            a: 1,
            b: -33,
            c: 555,
            d: 1,
            e: -1000
        };
    }
}