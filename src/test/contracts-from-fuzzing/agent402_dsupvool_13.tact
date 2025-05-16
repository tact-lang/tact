struct Inner {
    n: Int = 42;
    b: Bool = true;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{};
    }
}