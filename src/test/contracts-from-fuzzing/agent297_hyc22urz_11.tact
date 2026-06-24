struct NestedOptional {
    opt: Bool?;
}

contract TestContract {
    inner: NestedOptional?;

    init() {
        self.inner = null;
    }
}