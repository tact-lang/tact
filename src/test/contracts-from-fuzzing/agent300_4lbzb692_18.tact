struct Inner {
    a: Int;
}

contract Test {
    nested: Inner?;
    init() {
        self.nested = null;
    }
}