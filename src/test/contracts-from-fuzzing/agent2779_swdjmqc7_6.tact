struct SerialFormats {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint256;
}

contract SerializedFields {
    formats: SerialFormats;
    init() {
        self.formats = SerialFormats{
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}