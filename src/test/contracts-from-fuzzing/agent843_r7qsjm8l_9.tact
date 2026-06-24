struct InnerMost {
    x: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract DeepNestingFour {
    value: Outer;

    init() {
        self.value = Outer{ inner: Inner{ innerMost: InnerMost{ x: 5 } } };
    }
}