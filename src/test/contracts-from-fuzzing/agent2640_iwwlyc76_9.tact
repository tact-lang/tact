struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Bool;
    e: Bool?;
}

contract TestContract {
    test: SerialTest;

    init() {
        self.test = SerialTest{
            a: 1,
            b: -123,
            c: 1000000000,
            d: true,
            e: null
        };
    }
}
