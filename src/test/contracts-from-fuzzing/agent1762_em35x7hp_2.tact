struct InnerMost {
    alpha: Bool;
}

struct Middle {
    inner: InnerMost;
    val: Int;
}

struct Outer {
    mid: Middle;
}

contract NestedDeep {
    foo: Outer;

    init() {
        self.foo = Outer{
            mid: Middle{
                inner: InnerMost{
                    alpha: false,
                },
                val: 123,
            },
        };
    }
}