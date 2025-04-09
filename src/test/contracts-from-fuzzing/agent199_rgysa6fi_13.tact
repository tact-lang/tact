struct SerializeTest {
    n1: Int as int64;
    n2: Int as uint4;
    flag: Bool;
    text: String;
}

contract FieldSerialization {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            n1: -123,
            n2: 7,
            flag: true,
            text: "hi",
        };
    }
}
