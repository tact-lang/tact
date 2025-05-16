struct Inner {
    x: Int;
}

struct Wrapper {
    inner: Inner;
    flag: Bool;
}

contract ReorderOpt {
    w: Wrapper?;

    init() {
        self.w = null;
    }
}
