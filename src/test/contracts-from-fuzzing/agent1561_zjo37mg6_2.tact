struct InnerNested {
    foo: Int;
    bar: Bool?;
}

struct OuterNested {
    inner: InnerNested;
    str: String;
    optStr: String?;
}

contract DeepNestedStorage {
    val: OuterNested;

    init() {
        self.val = OuterNested{
            inner: InnerNested{
                foo: 42,
                bar: null,
            },
            str: "deep",
            optStr: null
        };
    }
}
