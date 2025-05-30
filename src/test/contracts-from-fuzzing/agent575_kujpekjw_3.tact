struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    foo: Inner;
    bar: String?;
}

contract NestedPersistent {
    state: Outer;

    init() {
        self.state = Outer{
            foo: Inner{ a: 42, b: null },
            bar: null
        };
    }
}