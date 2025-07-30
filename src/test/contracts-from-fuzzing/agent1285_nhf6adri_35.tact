struct Inner {
    a: Int? = 42;
    b: Bool? = true;
}

contract TestContract {
    field: Inner;
    init() {
        self.field = Inner{};
    }
}