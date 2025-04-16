struct SerTest {
    i8: Int as int8;
    u32: Int as uint32;
    i64: Int as int64;
}

contract TestContract {
    st: SerTest;

    init() {
        self.st = SerTest{ i8: -5, u32: 12345, i64: -123456789 };
    }
}