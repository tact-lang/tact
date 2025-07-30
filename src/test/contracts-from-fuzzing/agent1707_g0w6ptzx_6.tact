struct SerialFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
}

contract TestContract {
    data: SerialFormats;

    init() {
        self.data = SerialFormats{
            a: 255,
            b: -1234,
            c: 123456789,
            d: -1,
        };
    }
}
