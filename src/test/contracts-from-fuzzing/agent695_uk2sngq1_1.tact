struct InnerNested {
    flag: Bool;
    count: Int;
}

struct OuterNested {
    nested: InnerNested;
    note: String;
    optVal: Int?;
}

contract NestedStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nested: InnerNested{
                flag: true,
                count: 42,
            },
            note: "hi",
            optVal: null,
        };
    }
}