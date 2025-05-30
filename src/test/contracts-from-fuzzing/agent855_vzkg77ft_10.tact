struct SerTest {
    a: Int as int1;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint256;
}

contract SerContract {
    data: SerTest;

    init() {
        self.data = SerTest{
            a: 0,
            b: 255,
            c: -123456789,
            d: 123456789012345678901234567890,
        };
    }

    receive() {}
}