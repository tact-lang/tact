struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inn: Inner;
}

contract DeepNested {
    nested: Outer;
    init() {
        self.nested = Outer{ inn: Inner{ im: InnerMost{ x: 42 } } };
    }
}