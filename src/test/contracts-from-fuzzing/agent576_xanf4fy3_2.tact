struct Inner {
    b: Bool;
    x: Int;
}

contract DeepPersist {
    nested: Inner;

    init() {
        self.nested = Inner{ b: false, x: 0 };
    }
}
