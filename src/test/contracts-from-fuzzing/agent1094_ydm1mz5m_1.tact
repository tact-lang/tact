struct Inner {
    b: Int;
}

struct Outer {
    a: Int;
    inner: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            a: 1,
            inner: Inner{b:2}
        };
    }
}