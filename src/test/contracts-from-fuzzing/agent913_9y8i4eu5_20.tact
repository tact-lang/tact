struct Nested {
    a: Bool?;
}

contract TestContract {
    inner: Nested?;
    init() {
        self.inner = null;
    }
}