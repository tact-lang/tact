struct Inner {
    x: Int;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{x: 777};
    }
}