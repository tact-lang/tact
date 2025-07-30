struct MultiSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int;
}

contract MultiSerializeTest {
    val: MultiSerialization;
    init() {
        self.val = MultiSerialization{
            a:255, b:-12345, c:123456, d:-1
        };
    }
}