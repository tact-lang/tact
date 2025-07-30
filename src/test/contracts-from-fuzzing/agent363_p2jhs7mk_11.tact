struct SerializeIntFormats {
    signed64: Int as int64;
    unsigned8: Int as uint8;
    full: Int;
}

contract TestContract {
    s: SerializeIntFormats;

    init() {
        self.s = SerializeIntFormats{
            signed64: -3,
            unsigned8: 250,
            full: 123456789
        };
    }
}