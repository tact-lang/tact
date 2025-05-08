struct SerializeTest {
    small: Int as uint4;
    mid: Int as int32;
    large: Int as uint128;
}

contract TestContract {
    ser: SerializeTest;

    init() {
        self.ser = SerializeTest{
            small: 5,
            mid: -99999,
            large: 1234567890123456789,
        };
    }
}