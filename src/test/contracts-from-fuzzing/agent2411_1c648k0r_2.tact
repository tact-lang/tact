struct InnerMost {
    value: Int?;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    note: String;
}

contract DeepNestedTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{
                innerMost: InnerMost{value: null},
                flag: false
            },
            note: "deep"
        };
    }
}