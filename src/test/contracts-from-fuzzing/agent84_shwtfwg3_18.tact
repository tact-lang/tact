struct Inner {
    foo: Int;
}

contract TestContract {
    s: Inner?;
    init() {
        self.s = null;
    }
}