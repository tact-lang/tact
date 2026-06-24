struct Formats {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
}

contract Serialized {
    fmt: Formats;

    init() {
        self.fmt = Formats{a: -5, b: 250, c: 12345, d: 1234567890, e: -99999999};
    }
}