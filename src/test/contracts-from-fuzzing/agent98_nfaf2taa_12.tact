struct SerializeTest {
    small: Int as uint8;
    big: Int as int257;
    med: Int as uint64;
    flag: Bool;
}

contract SerializeContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{ small: 255, big: -5, med: 123456789, flag: true };
    }
}