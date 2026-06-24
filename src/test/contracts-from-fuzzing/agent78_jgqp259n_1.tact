struct NestedInner {
    a: Int;
    b: Bool;
}

struct DeepNested {
    x: Int;
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            x: 1,
            inner: NestedInner {
                a: 42,
                b: true,
            },
            flag: false,
        };
    }
}