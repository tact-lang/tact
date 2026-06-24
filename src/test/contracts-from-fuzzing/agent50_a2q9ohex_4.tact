struct SerializeTest {
    smallInt: Int as uint4;
    medInt: Int as int32;
    bigInt: Int;
    tinyBool: Bool;
}

contract SerializationContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            smallInt: 7,
            medInt: 123456,
            bigInt: 9876543210,
            tinyBool: true
        };
    }
}