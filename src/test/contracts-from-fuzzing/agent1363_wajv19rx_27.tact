struct FlatHints {
    a: Int as int64;
    b: Int? as uint64;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract StructWithHints {
    data: FlatHints;

    init() {
        self.data = FlatHints{
            a: 100,
            b: null,
            c: true,
            d: false,
            e: "hello",
            f: null,
        };
    }
}