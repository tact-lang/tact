struct SerialFormats {
    a: Int as int32;
    b: Int as uint64;
    c: Int as int16;
}

contract SerialInStruct {
    rec: SerialFormats;

    init() {
        self.rec = SerialFormats{
            a: -12345,
            b: 123456789,
            c: -12
        };
    }
}