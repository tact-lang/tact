struct Inner {
    i1: Int;
    i2: Bool?;
}

contract TestContract {
    nested: Inner = Inner{i1: 5};
    receive() {
        self.nested = Inner{i1: 12, i2: true};
    }
}