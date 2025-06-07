struct SerializationTest {
    a: Int as uint8;
    b: Int as int64;
    c: Int as int257;
}

contract SerializeFields {
    storage: SerializationTest;

    init() {
        self.storage = SerializationTest{
            a: 1,
            b: 2,
            c: 3
        };
    }
}