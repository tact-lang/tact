struct Inner {
    val1: Int = 5;
    val2: Bool = true;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{};
    }
}