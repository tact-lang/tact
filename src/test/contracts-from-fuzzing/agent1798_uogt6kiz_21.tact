struct WithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as int257;
}

contract SerializationTest {
    dat: WithSerialization;
    init() {
        self.dat = WithSerialization{ a: 7, b: -4, c: 1 };
    }
}