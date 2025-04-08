struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ value: 42 } };
    }
}