struct InnerMost {
    v: Int?;
}

struct Inner {
    foo: Int;
    bar: Bool?;
    nested: InnerMost;
}

struct Outer {
    first: Inner;
    second: Inner?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            first: Inner{
                foo: 42,
                bar: null,
                nested: InnerMost{ v: null }
            },
            second: null
        };
    }
}