struct SerializeTest {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257;
}

contract TestContract {
    field: SerializeTest;

    init() {
        self.field = SerializeTest{
            a: 255, b: -1000, c: 123456789, d: -1
        };
    }
}