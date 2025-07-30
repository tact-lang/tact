struct SerialTest {
    a: Int as uint8;
    b: Int as int1;
    c: Int as uint16;
    d: Int;
}

contract SerialContract {
    s: SerialTest;

    init() {
        self.s = SerialTest{
            a: 5,
            b: 0,
            c: 300,
            d: 42
        };
    }
}