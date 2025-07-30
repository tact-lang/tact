struct InnerMost {
    deep: String;
    flag: Bool;
}

struct Inner {
    nested: InnerMost;
    x: Int;
}

struct Outer {
    nestedInner: Inner;
    s: String;
    b: Bool?;
}

contract DeepNestedContract {
    item: Outer;
    init() {
        self.item = Outer{
            nestedInner: Inner{
                nested: InnerMost{
                    deep: "hello",
                    flag: true,
                },
                x: 42,
            },
            s: "world",
            b: null,
        };
    }
}
