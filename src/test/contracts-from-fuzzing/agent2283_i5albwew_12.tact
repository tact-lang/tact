struct WithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint4;
    d: Int as int257;
    e: Bool;
    f: String;
}

contract SerializationStructContract {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            a: 100,
            b: -1000,
            c: 7,
            d: 123456789,
            e: true,
            f: "str"
        };
    }
}
