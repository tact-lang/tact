struct Ints {
    a: Int;
    b: Int;
    c: Int;
}

struct Wrapper {
    inner: Ints;
}

contract WrappedInts {
    w: Wrapper;
    init() {
        self.w = Wrapper{ inner: Ints{ a:1, b:2, c:3 } };
    }
}