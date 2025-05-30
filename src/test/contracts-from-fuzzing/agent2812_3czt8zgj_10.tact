struct SerialOpts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int;
}

contract SerialFields {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{
            a: 255,
            b: -10000,
            c: 8,
            d: -1
        };
    }
}