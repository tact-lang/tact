struct ContainsStringOpt {
    inner: String?;
}

contract NestedStrOpt {
    s: ContainsStringOpt;

    init() {
        self.s = ContainsStringOpt{
            inner: null
        };
    }
}