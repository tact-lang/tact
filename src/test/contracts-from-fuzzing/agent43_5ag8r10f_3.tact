struct InnerMost {
    d: Int;
}

struct Inner {
    b: Bool;
    c: InnerMost;
}

contract DeepNested {
    a: Inner;

    init() {
        self.a = Inner{ b: true, c: InnerMost{ d: 7 } };
    }
}