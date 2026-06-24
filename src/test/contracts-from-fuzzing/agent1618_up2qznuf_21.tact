struct ExplicitSerial {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int256;
    d: Int as uint32;
}

contract ExplicitLayout {
    vals: ExplicitSerial;

    init() {
        self.vals = ExplicitSerial{
            a: 250,
            b: 123456789,
            c: -1000,
            d: 98765
        };
    }
}