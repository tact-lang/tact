struct SerialFormats {
    a: Int as uint4;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int8;
}

contract SerialTest {
    st: SerialFormats;

    init() {
        self.st = SerialFormats{
            a: 1,
            b: -12,
            c: 123456,
            d: -7,
        };
    }
}