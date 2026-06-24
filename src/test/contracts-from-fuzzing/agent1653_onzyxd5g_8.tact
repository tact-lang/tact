struct Inner {
    x: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{x: true};
    }

    receive() {
        self.nested = Inner{x: false};
    }
}