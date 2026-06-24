struct Inner {
    val: Int;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract Test {
    nested: Outer;
    init() {
        self.nested = Outer{
            first: Inner{val:1},
            second: Inner{val:2}
        };
    }
}