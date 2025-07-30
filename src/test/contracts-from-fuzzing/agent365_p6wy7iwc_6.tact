struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
}

contract DoubleNesting {
    data: Outer;
    init() {
        self.data = Outer{
            nested1: Inner{a:1, b:2},
            nested2: Inner{a:3, b:4}
        };
    }
}