struct SerialMixed {
    a: Int as uint32;
    b: Int as int64;
    c: Int as coins;
    d: Int;
}

contract TestSerialMixed {
    field: SerialMixed;

    init() {
        self.field = SerialMixed{
            a: 42,
            b: -100000,
            c: 1230000000,
            d: 99
        };
    }
}