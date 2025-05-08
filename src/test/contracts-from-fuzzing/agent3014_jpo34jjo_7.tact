struct SerialTest {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as coins;
    d: Bool;
}

contract TestContract {
    data: SerialTest;

    init() {
        self.data = SerialTest{
            a: 1,
            b: 2,
            c: ton("1"),
            d: true,
        };
    }
}