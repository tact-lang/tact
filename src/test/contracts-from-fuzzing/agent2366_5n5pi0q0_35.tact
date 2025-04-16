struct S {
    foo: Int;
}

struct Wrapper {
    inner: S;
}

contract OptWrap {
    w: Wrapper?;

    init() {
        self.w = null;
    }
}