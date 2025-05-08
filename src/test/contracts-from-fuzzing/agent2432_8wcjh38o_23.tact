struct ABig {
    x1: Int as int64;
    x2: Int as uint64;
    x3: Bool;
    x4: String;
    x5: Bool?;
    x6: String?;
    x7: Int?;
    x8: Int;
    x9: String;
    x10: Bool;
}

contract Test {
    field: ABig;
    init() {
        self.field = ABig{
            x1: -100,
            x2: 100,
            x3: true,
            x4: "hello",
            x5: null,
            x6: null,
            x7: null,
            x8: 1,
            x9: "bye",
            x10: false
        };
    }
}