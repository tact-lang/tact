struct Inner {
    flag: Bool;
    count: Int as uint8;
}

contract NestedStorageTest {
    data: Inner;

    init() {
        self.data = Inner{flag: true, count: 7};
    }
}