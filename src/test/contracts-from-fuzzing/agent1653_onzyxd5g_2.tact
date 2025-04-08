struct Inner {
    i1: Int;
    i2: Bool;
}

contract TestContract {
    nested: Inner = Inner{i1: 5, i2: false};
    receive() {
        self.nested = Inner{i1: 1, i2: true};
    }
}