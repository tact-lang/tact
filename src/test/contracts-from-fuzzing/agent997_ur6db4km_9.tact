struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: null
        };
    }
}