struct WithSerialization {
    smallInt: Int as uint8;
    bigInt: Int as int256;
    flag: Bool;
    message: String;
}

contract SerializeFields {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            smallInt: 255,
            bigInt: 1234567890,
            flag: true,
            message: "hello",
        };
    }
}