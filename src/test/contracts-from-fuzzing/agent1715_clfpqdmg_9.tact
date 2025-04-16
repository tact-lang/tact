struct WithSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Bool;
    e: String;
}

contract SerializedStruct {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            a: 1,
            b: -100,
            c: 1000,
            d: true,
            e: "hello",
        };
    }
}