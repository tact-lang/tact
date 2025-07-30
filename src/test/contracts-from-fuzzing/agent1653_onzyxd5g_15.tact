struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    nested: Inner = Inner{x: 5};
    receive() {
        self.nested = Inner{x: 7, y: false};
    }
}