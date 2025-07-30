struct SerialOrderTest {
    foo: Int as uint32;
    bar: Int as uint8;
    baz: Int as int257;
}

contract SerializationOrder {
    s: SerialOrderTest;
    init() {
        self.s = SerialOrderTest{foo: 1, bar: 2, baz: 3};
    }
    receive() {}
}