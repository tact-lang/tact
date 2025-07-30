struct Inner { value: Int; }

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{value: 42};
    }
}