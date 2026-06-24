struct NestedBoolOpt {
    inner: Bool?;
}

contract TestContract {
    nb: NestedBoolOpt?;

    init() {
        self.nb = null;
    }
}