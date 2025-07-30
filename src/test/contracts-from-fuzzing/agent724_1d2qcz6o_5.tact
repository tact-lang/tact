struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost?;
}

contract TestContract {
    foo: Inner?;

    init() {
        self.foo = null;
    }
}