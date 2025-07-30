struct InnerMost {
    value: Int;
}

struct Inner {
    maybe: InnerMost?;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    txt: String;
}

contract DeepNestedTester {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{
                maybe: null,
                flag: true,
            },
            txt: "hello",
        };
    }
}