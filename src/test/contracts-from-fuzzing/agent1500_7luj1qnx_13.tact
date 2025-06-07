struct InnerMost {
    value: Bool;
}

struct Inner {
    x: Int;
    inner: InnerMost;
}

contract BoolNested {
    f: Inner;

    init() {
        self.f = Inner{ x:42, inner:InnerMost{ value:true } };
    }
}