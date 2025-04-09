struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{inner: Inner{a: 1}, b: 2};
    }
}
