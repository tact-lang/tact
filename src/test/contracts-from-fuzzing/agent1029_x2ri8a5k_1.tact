struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{a: 1, b: true};
    }
}