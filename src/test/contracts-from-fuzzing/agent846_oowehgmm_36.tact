struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    nested: Inner?;
    baz: Int;
}

contract Test {
    state: Outer?;

    init() {
        self.state = Outer {
            nested: Inner{ foo: null, bar: true },
            baz: 123
        };
    }
}