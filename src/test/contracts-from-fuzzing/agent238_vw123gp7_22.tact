struct SerializeTest {
    i64: Int as int64;
    u8: Int as uint8;
    coins: Int as coins;
}

contract SerContract {
    st: SerializeTest;

    init() {
        self.st = SerializeTest{
            i64: 123,
            u8: 255,
            coins: 1000000000
        };
    }
}