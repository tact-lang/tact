struct Inner {
    data: Slice? = null;
}

struct Outer {
    inner: Inner;
}

contract SliceOptNested {
    st: Outer;

    init() {
        self.st = Outer{
            inner: Inner{}
        };
    }
}
