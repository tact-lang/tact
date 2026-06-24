struct NestedOptional {
    inner: Int?;
}

contract TestContract {
    nopt: NestedOptional?;

    init() {
        self.nopt = null;
    }
}