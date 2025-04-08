struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer {
            inner: Inner {
                val: null,
            },
        };
    }
}