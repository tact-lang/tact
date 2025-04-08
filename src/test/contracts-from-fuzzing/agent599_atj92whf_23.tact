struct Inner {
    x: Int;
}

struct Wrapper {
    inner: Inner;
}

contract NestedUpdate {
    s: Wrapper;
    init() {
        self.s = Wrapper{inner: Inner{x:1}};
    }

    receive() {
        self.s.inner.x = 42;
    }
}