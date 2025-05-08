struct InnerMost {
    foo: Int;
}

struct Inner {
    a: Bool;
    nested: InnerMost;
}

struct Outer {
    first: Inner;
    second: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            first: Inner{
                a: true,
                nested: InnerMost{
                    foo: 99,
                },
            },
            second: false,
        };
    }
}