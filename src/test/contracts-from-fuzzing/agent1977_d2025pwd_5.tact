struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    inner: Inner;
}

contract Test {
    nested: Middle;

    init() {
        self.nested = Middle{
            inner: Inner{
                im: InnerMost{ val: 123 }
            }
        };
    }
}
