struct Outer {
    foo: Int;
    inner: Inner;
}

struct Inner {
    bar: Int;
}

contract NestedAssignment {
    s: Outer;

    init() {
        self.s = Outer{
            foo: 10,
            inner: Inner{
                bar: 20,
            },
        };
    }
}