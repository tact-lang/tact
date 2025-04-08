struct IntSerials {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int16;
    d: Int as int64;
}

contract SerialMixes {
    val: IntSerials;

    init() {
        self.val = IntSerials{
            a: 1,
            b: 100,
            c: -30,
            d: 1000000
        };
    }
}