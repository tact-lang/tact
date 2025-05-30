struct SerialInt {
    a: Int as int8;
    b: Int as uint64;
    c: Int as int257;
}

contract SerializationTest {
    val: SerialInt;

    init() {
        self.val = SerialInt{ a: 7, b: 42, c: -123 };
    }
}