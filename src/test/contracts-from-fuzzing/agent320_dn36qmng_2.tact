struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner1: Inner{foo: 1, bar: true},
            inner2: Inner{foo: 2, bar: false},
        };
    }
}