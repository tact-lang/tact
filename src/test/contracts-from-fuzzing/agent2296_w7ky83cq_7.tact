struct NestedOpt {
    inner: Int?;
}

contract NestedOptField {
    n: NestedOpt?;

    init() {
        self.n = null;
    }
}
