struct Inner {
    x: Int;
}

struct Outer {
    foo: Int;
    bar: Bool?;
    nested: Inner;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            foo: 1,
            bar: true,
            nested: Inner{x: 5}
        };
    }
}