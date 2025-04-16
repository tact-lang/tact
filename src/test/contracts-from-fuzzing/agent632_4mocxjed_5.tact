struct NestedOptional {
    inner: Int?;
}

contract TestContract {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}