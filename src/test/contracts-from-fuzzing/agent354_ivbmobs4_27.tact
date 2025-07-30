struct SerialFormats {
    a: Int as uint64;
    b: Int as coins;
    c: Int as int16;
}

contract SerialFormatsTest {
    data: SerialFormats;

    init() {
        self.data = SerialFormats{
            a:999,
            b:1000000000,
            c:-123
        };
    }
}