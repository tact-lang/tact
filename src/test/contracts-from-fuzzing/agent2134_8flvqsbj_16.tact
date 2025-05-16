struct IntFormats {
    a: Int as int8;
    b: Int as uint32;
    c: Int as int64;
    d: Int;
}

contract IntFormatsContract {
    val: IntFormats;

    init() {
        self.val = IntFormats{
            a: -100,
            b: 100000,
            c: 1234567890,
            d: -1234567890
        };
    }
}