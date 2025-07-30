struct Mixed {
    a: Int as uint16;
    b: Int?;
    c: String?;
    d: Bool;
    e: Int as int64;
}

contract MixedPersistent {
    mix: Mixed;

    init() {
        self.mix = Mixed{
            a: 65535,
            b: null,
            c: "hello",
            d: true,
            e: -123456789
        };
    }
}
