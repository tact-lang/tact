struct NestedInner {
    f1: Int;
    f2: Int?;
}

struct NestedOuter {
    inner: NestedInner;
    label: String;
    flag: Bool;
}

contract TestContract {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            inner: NestedInner{
                f1: 11,
                f2: null,
            },
            label: "hello",
            flag: true,
        };
    }
}