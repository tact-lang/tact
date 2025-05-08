struct WithSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: Int;
}

contract SerializedFieldsStorage {
    val: WithSerialization;

    init() {
        self.val = WithSerialization{
            a: 1000,
            b: 42,
            c: true,
            d: -7,
        };
    }
}