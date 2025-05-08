struct WithSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint16;
}

contract SerializationStructTest {
    s: WithSerialization;
    init() {
        self.s = WithSerialization{a:5,b:-10,c:42};
    }
}