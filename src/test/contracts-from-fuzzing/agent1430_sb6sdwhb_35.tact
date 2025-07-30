struct WithSerializations {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
}

contract STest {
    s: WithSerializations;

    init() {
        self.s = WithSerializations{
            a: 255,
            b: -123456,
            c: 1000000
        };
    }
}
