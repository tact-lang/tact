struct Inner {
    a: Int;
    b: Bool;
}

contract NestedFields {
    nested: Inner;

    init() {
        self.nested = Inner{a: 42, b: true};
    }
}