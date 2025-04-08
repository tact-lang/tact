struct InnerMost {
    flag: Bool;
}

struct Inner {
    val: Int;
    nested: InnerMost?;
}

struct Wrapper {
    inner: Inner;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Inner{val: 1, nested: InnerMost{flag: true}},
        };
    }
}
