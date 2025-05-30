struct InnerMost {
    x: Int;
    y: Int?;
}

struct Inner {
    foo: Bool;
    bar: InnerMost;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            foo: true,
            bar: InnerMost{ x: 42, y: null }
        };
    }
}