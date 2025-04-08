struct RemInner {
    a: Int;
    rem: Slice as remaining;
}

struct Wrapper {
    prefix: Int;
    inner: RemInner;
}

contract NestedRem {
    st: Wrapper;

    init() {
        self.st = Wrapper {
            prefix: 9,
            inner: RemInner { a: 5, rem: emptyCell().asSlice() }
        };
    }
}