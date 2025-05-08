struct NestedInits {
    a: Int = 1;
    b: Int = 2;
}

contract TestContract {
    inner: NestedInits;

    init() {
        self.inner = NestedInits{};
    }
}