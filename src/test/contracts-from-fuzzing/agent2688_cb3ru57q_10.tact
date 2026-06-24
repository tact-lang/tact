struct Parametrized {
    a: Int as int1;
    b: Bool;
    c: Int as uint8;
    d: Int as int32;
    e: Int as uint251;
    f: Int as int64;
}

contract ParamSerializations {
    data: Parametrized;

    init() {
        self.data = Parametrized{
            a: 0,
            b: true,
            c: 255,
            d: 123456,
            e: 123456789,
            f: 42
        };
    }
}