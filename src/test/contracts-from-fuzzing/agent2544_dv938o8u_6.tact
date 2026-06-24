struct WithSerialization {
    bigInt: Int as uint256;
    tinyInt: Int as int1;
    text: String;
    boolean: Bool;
}

contract SerializationTest {
    s: WithSerialization;
    init() {
        self.s = WithSerialization{
            bigInt: 123456,
            tinyInt: 1,
            text: "hello",
            boolean: true
        };
    }
}