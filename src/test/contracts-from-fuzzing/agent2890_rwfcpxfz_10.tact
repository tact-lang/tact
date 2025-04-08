struct SerialOpts {
    a: Int? as uint8;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptSerialTest {
    s: SerialOpts;

    init() {
        self.s = SerialOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}