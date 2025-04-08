struct ChainSerialization {
    a: Int as uint64;
    b: Int as int32;
    c: Bool;
    d: String;
}

contract FieldSerialization {
    data: ChainSerialization;

    init() {
        self.data = ChainSerialization{
            a: 42,
            b: -1000,
            c: true,
            d: "val",
        };
    }
}
