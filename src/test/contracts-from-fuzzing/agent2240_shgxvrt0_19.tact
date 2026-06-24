struct WithDifferentSerialization {
    a: Int as int8;
    b: Int as uint32;
    c: Int as int257;
}

contract DiffSerialTest {
    s: WithDifferentSerialization;

    init() {
        self.s = WithDifferentSerialization{
            a: -8,
            b: 9999,
            c: -1234567890123456789
        };
    }
}