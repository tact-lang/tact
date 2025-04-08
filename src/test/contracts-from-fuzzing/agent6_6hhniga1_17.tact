struct UseSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
}

contract TestContract {
    s: UseSerialization;

    init() {
        self.s = UseSerialization{
            a: 255,
            b: -1234,
            c: 15,
        };
    }
}
