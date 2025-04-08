struct SerTest {
    foo: Int as uint32;
    bar: Int as int8;
    baz: Int as uint4;
}

contract SerializationExample {
    s: SerTest;

    init() {
        self.s = SerTest{ foo: 12345, bar: -8, baz: 9 };
    }
}