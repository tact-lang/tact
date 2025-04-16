struct SerializeTest {
    small: Int as uint8;
    mid: Int as uint64;
    big: Int as int257;
}

contract SerializedPersistent {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            small: 255,
            mid: 999999999,
            big: -123456789
        };
    }
}