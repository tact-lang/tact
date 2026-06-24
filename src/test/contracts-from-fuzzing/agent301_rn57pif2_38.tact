struct Inner {
    foo: Int;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{}; // no mid assigned
    }

    receive() {
        let _ = self.data.mid!!.inner;
    }
}