struct Inner {
    x: Int?;
    y: Int;
}

contract Test {
    nested: Inner;
    init() {
        self.nested = Inner{x: null, y: 7};
    }
}