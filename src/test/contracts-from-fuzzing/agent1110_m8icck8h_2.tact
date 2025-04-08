struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    foo: Inner?;

    init() {
        self.foo = null;
    }
}