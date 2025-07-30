struct Inner {
    val: Int = 1;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{ inner: Inner{ val: 42 } };
    }

    receive() {
        dump(self.outer.inner.val);
    }
}