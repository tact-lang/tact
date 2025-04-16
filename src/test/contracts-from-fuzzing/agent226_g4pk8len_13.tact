struct SerializationTest {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint1;
}

contract SerializationFields {
    val: SerializationTest;

    init() {
        self.val = SerializationTest{
            a: 7,
            b: 42,
            c: 1
        };
    }
}