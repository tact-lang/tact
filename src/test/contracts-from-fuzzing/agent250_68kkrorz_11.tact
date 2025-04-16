struct NestedOpt {
    inner: String?;
}

contract NestedOptContract {
    f: NestedOpt?;

    init() {
        self.f = null;
    }
}