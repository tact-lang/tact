struct Inner {
    x: Int;
}

struct Outer {
    foo: Int;
    inner: Inner?;
}

contract TestContract {
    complex: Outer?;

    init() {
        self.complex = null;
    }
}