struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract DeepNested {
    nested: Outer;

    init() {
        self.nested = Outer{
            first: Inner{a: 1, b: false},
            second: Inner{a: 2, b: true},
        };
    }
}
