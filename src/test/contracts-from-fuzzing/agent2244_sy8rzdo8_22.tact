struct MixSerial {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
    d: Bool;
    e: Bool;
    f: String?
}

contract NestedSerial {
    storage: MixSerial;

    init() {
        self.storage = MixSerial{
            a: -100,
            b: 200,
            c: -1,
            d: true,
            e: false,
            f: null
        };
    }
}