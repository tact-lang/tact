struct SerializationTest {
    n1: Int as uint8;
    n2: Int as int16;
    n3: Int as uint32;
    flag: Bool;
}

contract SerializeFields {
    data: SerializationTest;

    init() {
        self.data = SerializationTest{
            n1: 1,
            n2: -2,
            n3: 3,
            flag: true
        };
    }
}