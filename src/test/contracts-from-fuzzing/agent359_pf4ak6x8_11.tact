struct IntSerial {
    small: Int as uint4;
    big: Int as uint64;
    huge: Int as int257;
}

contract SerializeTest {
    val: IntSerial;
    init() {
        self.val = IntSerial{small: 1, big: 2, huge: 3};
    }
}