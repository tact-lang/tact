struct SerialTest {
    a: Int as int4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as uint128;
}

contract SerialContract {
    data: SerialTest;
    init() {
        self.data = SerialTest{
            a: 2,
            b: 3,
            c: 4,
            d: 5,
        };
    }
}