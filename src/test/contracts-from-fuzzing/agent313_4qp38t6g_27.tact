struct VariedSerialization {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int257;
    d: Int as int64;
}

contract VariousSerializationTest {
    val: VariedSerialization;

    init() {
        self.val = VariedSerialization{a:1,b:2,c:3,d:4};
    }
}