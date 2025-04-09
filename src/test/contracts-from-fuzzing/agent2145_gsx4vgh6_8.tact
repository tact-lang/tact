struct SerialTest {
    int4: Int as int4;
    uint8: Int as uint8;
    int64: Int as int64;
    coinsVal: Int as coins;
}

contract StorageTest {
    val: SerialTest;

    init() {
        self.val = SerialTest{
            int4: 3,
            uint8: 250,
            int64: -42,
            coinsVal: ton("1")
        };
    }
}