struct InnerMost {
    value: Int;
}

struct Inner {
    maybe: InnerMost?;
}

struct Outer {
    nested: Inner?;
}

contract DeepOpt {
    data: Outer;

    init() {
        self.data = Outer{ nested: null };
    }
}
