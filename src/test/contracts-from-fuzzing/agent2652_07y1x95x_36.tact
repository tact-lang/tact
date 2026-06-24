struct Outer {
    foo: Int;
}

struct Middle {
    inner: Outer;
}

struct InnerMost {
    mid: Middle;
}

contract DeeplyNested {
    val: InnerMost;
    init() {
        self.val = InnerMost{ mid: Middle{ inner: Outer{ foo:123 } } };
    }
}