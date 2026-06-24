struct FormatMix {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int257;
    opt: Int?;
}

contract Test {
    data: FormatMix;

    init() {
        self.data = FormatMix{
            a: 255,
            b: 1234567890123,
            c: -42,
            opt: null
        };
    }
}