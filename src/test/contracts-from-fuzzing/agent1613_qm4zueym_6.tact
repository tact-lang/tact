struct SerializeTest {
    tiny: Int as uint4;
    neg: Int as int8;
    big: Int as uint256;
    coin: Int as coins;
}

contract SerializeFields {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            tiny: 7,
            neg: -5,
            big: 12345,
            coin: 1
        };
    }
}