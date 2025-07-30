struct WithSerializations {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as coins;
}

contract TestContract {
    s: WithSerializations;

    init() {
        self.s = WithSerializations{
            a: 5,
            b: -7,
            c: 300,
            d: -200,
            e: ton("1")
        };
    }
}