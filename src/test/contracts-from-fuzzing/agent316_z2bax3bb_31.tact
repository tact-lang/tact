struct Inner {
    s: Slice;
}

struct Outer {
    inner: Inner;
    own: Slice;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ s: emptyCell().asSlice() },
            own: emptyCell().asSlice()
        };
    }
}
