struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    data: Outer = Outer{ inner: Inner{ val: 5 } };

    init() {
        self.data = Outer{ inner: Inner{ val: 10 } };
    }
}