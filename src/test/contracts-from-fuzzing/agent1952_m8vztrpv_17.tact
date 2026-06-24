struct DifferentSerializations {
    a: Int as int64;
    b: Int as uint32;
    c: Int;
    d: Int as int128;
    e: Int as uint8;
}

contract TestContract {
    s: DifferentSerializations;

    init() {
        self.s = DifferentSerializations{
            a: -1,
            b: 42,
            c: -1000,
            d: 55555,
            e: 7,
        };
    }
}
