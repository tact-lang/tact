struct NestedSerialization {
    inner: SerialTest;
    flag: Bool;
}

struct SerialTest {
    int4: Int as int4;
    uint8: Int as uint8;
    int64: Int as int64;
    coinsVal: Int as coins;
}

contract StorageTest {
    val: NestedSerialization;

    init() {
        self.val = NestedSerialization{
            inner: SerialTest{
                int4: 2,
                uint8: 128,
                int64: 1000000,
                coinsVal: ton("0.5")
            },
            flag: false
        };
    }
}