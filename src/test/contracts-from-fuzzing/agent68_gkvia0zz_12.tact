struct NestedStrOpt {
    s: String?;
}

contract ChainOpt {
    n1: NestedStrOpt?;
    n2: NestedStrOpt?;

    init() {
        self.n1 = null;
        self.n2 = null;
    }
}