struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
}

struct Outer {
    deeper: Inner;
}

contract DeepNested {
    s: Outer;

    init() {
        self.s = Outer{ deeper: Inner{ nested: InnerMost{ val: 1 }}};
    }
}