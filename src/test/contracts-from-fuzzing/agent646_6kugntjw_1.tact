struct NestedOpt {
    inner: Int?;
}

contract TestContract {
    value: NestedOpt?;

    init() {
        self.value = null;
    }
}