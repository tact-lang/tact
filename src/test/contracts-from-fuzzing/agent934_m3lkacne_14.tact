struct InnerOpt {
    f: Int?;
}

contract NullNestedAssign {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{
            f: null,
        };
    }
}