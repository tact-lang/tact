struct NestedOpt {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{
            inner: null
        };
    }
}