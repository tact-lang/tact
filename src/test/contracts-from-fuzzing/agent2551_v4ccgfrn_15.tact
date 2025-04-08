struct SerializeTest {
    x: Int as uint8;
    y: Int as int64;
    z: Int as coins;
}

contract SerializeContract {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            x: 55,
            y: 12345678,
            z: 1000
        };
    }
}