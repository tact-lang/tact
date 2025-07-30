struct SerializeTest {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;
}

contract TestContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{a: -10, b: 20, c: -3, d: 7};
    }
}