struct DeepNested {
    inner: Inner;
    boolVal: Bool;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: Inner{ x: 1, y: 2 },
            boolVal: true
        };
    }
}