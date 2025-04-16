contract TestDeepNested {
    foo: Outer;

    init() {
        self.foo = Outer{
            nested: Inner{
                optInnerInner: null,
                val: 42
            },
            number: 1
        };
    }
}

struct Outer {
    nested: Inner;
    number: Int;
}

struct Inner {
    optInnerInner: InnerInner?;
    val: Int;
}

struct InnerInner {
    val: Int;
}
