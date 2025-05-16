struct Inner {
    foo: Int;
    bar: String?;
}

contract TestContract {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}