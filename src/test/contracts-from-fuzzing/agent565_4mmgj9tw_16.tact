struct WithSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: String;
}

contract SerializeTest {
    field: WithSerialization;
    init() {
        self.field = WithSerialization{
            a: 12,
            b: 34,
            c: true,
            d: "ser",
        };
    }
}